class Hike_And_User < ActiveRecord::Base
  belongs_to :hike
  belongs_to :user
end