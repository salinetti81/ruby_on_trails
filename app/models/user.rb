class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 	# has_and_belongs_to_many :hikes
 	validates :first_name, presence: false
 	validates :last_name, presence: false
 	validates :about, presence: false
 	# validates :image_urls, presence: false

 	has_many :hikes_and_users
  has_many :hikes, :through => :hikes_and_users 
end
