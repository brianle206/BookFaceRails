class User < ActiveRecord::Base
  has_secure_password
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, presence: true, length:{minimum: 2}
  validates :email, presence: true, uniqueness:{case_sensitive: false}, format:{with: EMAIL_REGEX}
  validates :password, presence: true, length:{minimum:4}
  before_save do 
  	self.email.downcase!
  	self.first_name.capitalize!
  	self.last_name.capitalize!
  end
end
