class Hike < ActiveRecord::Base
	has_many :hikes_and_users
  has_many :users, :through => :hikes_and_users
  

end


def self.search(search)
  where("name LIKE ?", "%#{search}%") 
  where("location LIKE ?", "%#{search}%")
end

