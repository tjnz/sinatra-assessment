class Business < ActiveRecord::Base
	validates_presence_of :name, :username, :password
	has_secure_password
	
	has_many :projects
	has_many :employees
	has_many :supplies
end