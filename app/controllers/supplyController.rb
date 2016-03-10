class SupplyController < ApplicationController
	
	get '/supplies' do 
		redirect_if_not_logged_in
		@business = current_user
		@supplies = @business.supplies.sort_by {|sup| sup[:name]}
		erb :'/supplies/index'
	end
	
	get '/supplies/new' do
		redirect_if_not_logged_in
    erb :'/supplies/new'
  end
  
  post '/supplies/new' do 
  	redirect_if_not_logged_in
  	supply = Supply.new(:name => params[:name], :business_id => current_user.id)
  	if supply.save
  		redirect '/supplies'
  	else
  		redirect '/supplies/new'
  	end
  end
	
	get '/supplies/:id/edit' do 
		redirect_if_not_logged_in
		@supply = Supply.find(params[:id])
		erb :'/supplies/edit'
	end
	
	patch '/supplies/:id' do 
		redirect_if_not_logged_in
		supply = Supply.find(params[:id])
		supply.update(params[:supply])
		redirect '/supplies'
	end
	
	delete '/supplies/:id' do 
		redirect_if_not_logged_in
		Supply.find_by_id(params[:id]).destroy
		redirect '/supplies'
	end
	
end