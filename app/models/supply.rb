class Supply < ActiveRecord::Base
	validates_presence_of :name
	
	belongs_to :business
	has_many :supply_projects
	has_many :projects, :through => :supply_projects
end
	