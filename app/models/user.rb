class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :confirmable, :lockable, :timeoutable,
    :omniauthable, omniauth_providers: [:facebook, :twitter]

  has_many :tickets

  # def self.create_with_omiauth(auth)
  #   create! do |u|
  #     u.provider = auth['provider']
  #     u.name = auth['info']['name']
  #   end
  # end

  def self.find_for_facebook_oauth(auth)
    unless user = find_by(auth.slice(:provider, :uid))
      user = create(name: auth.extra.raw_info.name,
                    provider: auth.provider,
                    uid: auth.uid,
                    email: auth.info.email,
                    token: auth.credentials.token,
                    password: Devise.friendly_token[0,20])
    end
    return user
  end

  def self.find_for_twitter_oauth(auth)
    unless user = find_by(auth.slice(:provider, :uid))
      user = create(name: auth.info.nickname,
                    provider: auth.provider,
                    uid: auth.uid,
                    email: UUID.generate + '@example.com',
                    token: auth.credentials.token,
                    password: Devise.friendly_token[0,20])
    end
    return user
  end

  protected

  def confirmation_required?
    #binding.pry
    !(["facebook", "twitter"].include? provider)
  end

end
