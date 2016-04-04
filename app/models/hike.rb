class Hike < ActiveRecord::Base
	has_and_belongs_to_many :users
	geocoded_by :name
	after_validation :geocode  
# Search Feature
def self.search(search)
  where("name ILIKE ? OR location ILIKE ?", "%#{search}%",  "%#{search}%") 

end


end

