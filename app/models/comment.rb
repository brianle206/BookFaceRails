class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  validates :comment, presence: true 
end
