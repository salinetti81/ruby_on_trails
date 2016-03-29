class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 	has_and_belongs_to_many :hikes
 	validates :first_name, presence: true
 	validates :last_name, presence: true
 	validates :about, presence: true
end
