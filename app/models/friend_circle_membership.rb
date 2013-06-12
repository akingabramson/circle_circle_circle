class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :circle_circle_id, :user_id

  belongs_to :circle_circle
  belongs_to :user

end
