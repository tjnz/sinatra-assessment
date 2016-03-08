class Project < ActiveRecord::Base
	validates_presence_of :name
	
	belongs_to :business
	
	has_many :employee_projects
	has_many :employees, :through => :employee_projects
	
	has_many :supply_projects
	has_many :supplies, :through => :supply_projects
	
end