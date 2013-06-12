class PostShare < ActiveRecord::Base
  attr_accessible :post_id, :circle_circle_ids

  belongs_to :post
  belongs_to :circle_circle
end
