class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable

  has_many :tickets

  def self.create_with_omiauth(auth)
    binding.pry
    create! do |u|
      u.provider = auth['provider']
      u.name = auth['info']['name']
    end
  end
end
