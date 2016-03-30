class Hike < ActiveRecord::Base
	has_many :hikes_and_users
  has_many :users, :through => :hikes_and_users

# Search Feature
def self.search(search)
  where("name ILIKE ? OR location ILIKE ?", "%#{search}%",  "%#{search}%") 

end

end