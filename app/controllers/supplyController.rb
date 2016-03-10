class SupplyController < ApplicationController
	
	get '/supplies' do 
		@business = current_user
		@supplies = @business.supplies
		erb :'/supplies/index'
	end
	
end