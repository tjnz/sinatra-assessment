class SupplyProject < ActiveRecord::Base
	belongs_to :supply 
	belongs_to :project 
end