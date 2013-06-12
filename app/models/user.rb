require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :name, :password, :session_token, :username, :posts_attributes

  validates :name, :password_digest, :username, :presence => true
  validates :username, :uniqueness => true

  has_many :friend_circle_memberships
  has_many :circle_circles, :through => :friend_circle_memberships
  has_many :posts

  accepts_nested_attributes_for :posts

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def verify_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(32)
    self.save!
    self.session_token
  end
end
