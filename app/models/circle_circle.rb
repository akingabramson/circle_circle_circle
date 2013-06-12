class CircleCircle < ActiveRecord::Base
  attr_accessible :name, :friend_ids

  validates :name, :presence => true

  has_many :friend_circle_memberships
  has_many :friends, :through => :friend_circle_memberships, :source => :user
  has_many :post_shares
  has_many :posts, through: :post_shares


end
