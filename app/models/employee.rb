class Employee < ActiveRecord::Base
	validates_presence_of :name
	
	belongs_to :business
	has_many :employee_projects
	has_many :projects, :through => :employee_projects
end
	