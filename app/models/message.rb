class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :message, presence:true
end
