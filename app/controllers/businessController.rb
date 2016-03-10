class BusinessController < ApplicationController
	
	get '/businesses' do 
		redirect_if_not_logged_in
		@businesses = Business.all.reverse
		erb :'/businesses/index'
	end
	
	get '/businesses/:id' do 
		redirect_if_not_logged_in
		@business = Business.find(params[:id])
		erb :'businesses/show'
	end

	get '/businesses/:id/edit' do 
		redirect_if_not_logged_in
		@business = Business.find(params[:id])
		erb :'businesses/edit'
	end
	
	patch '/businesses/:id/edit' do 
		redirect_if_not_logged_in
		business = Business.find(params[:id])
		binding.pry
		if valid_params?({:name => params[:name], :username => params[:username]})
			business.update(:name => params[:name], :username => params[:username])
			redirect "/businesses/#{business.id}"
		else
			@error_message = "All fields must be filled in"
			redirect "businesses/#{business.id}/edit"
		end
	end
	
end