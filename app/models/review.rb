class Review < ActiveRecord::Base
  validates_presence_of :product_id
  validates_presence_of :user_id
  validates_presence_of :description
  validates_presence_of :rating
end
