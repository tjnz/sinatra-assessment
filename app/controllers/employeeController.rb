class EmployeeController < ApplicationController
	
	get '/employees' do 
		@business = current_user
		@employees = @business.employees
		erb :'/employees/index'
	end
	
	get '/employees/:id' do 
		@employee = Employee.find(params[:id])
		erb :'/employees/show'
	end
	
end