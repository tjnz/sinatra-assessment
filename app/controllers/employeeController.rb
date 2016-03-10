class EmployeeController < ApplicationController
	
	get '/employees' do 
		redirect_if_not_logged_in
		@business = current_user
		@employees = @business.employees.sort_by {|emp| emp[:name]}
		erb :'/employees/index'
	end
	
	get '/employees/new' do
		redirect_if_not_logged_in
    erb :'/employees/new'
  end
  
  post '/employees/new' do 
  	redirect_if_not_logged_in
  	employee = Employee.new(:name => params[:name], :business_id => current_user.id)
  	if employee.save
  		redirect '/employees'
  	else
  		redirect '/employees/new'
  	end
  end
	
	get '/employees/:id/edit' do 
		redirect_if_not_logged_in
		@employee = Employee.find(params[:id])
		erb :'/employees/edit'
	end
	
	patch '/employees/:id' do 
		redirect_if_not_logged_in
		employee = Employee.find(params[:id])
		employee.update(params[:employee])
		redirect '/employees'
	end
	
	delete '/employees/:id' do 
		redirect_if_not_logged_in
		Employee.find_by_id(params[:id]).destroy
		redirect '/employees'
	end
	
end