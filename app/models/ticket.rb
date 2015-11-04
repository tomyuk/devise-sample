class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin

  validates :user_id, presence: true
  validates :message, presence: true, length: { maximum: 1000 }
end
