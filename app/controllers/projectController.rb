class ProjectController < ApplicationController
	
	get '/projects' do 
		redirect_if_not_logged_in
		@business = current_user
		@projects = @business.projects.reverse
		erb :'/projects/index'
	end
	
	get '/projects/new' do 
		redirect_if_not_logged_in
		@business = current_user
		erb :'/projects/new'
	end
	
	post '/projects/new' do 
		redirect_if_not_logged_in
		project = Project.create(:name => params[:name], :business_id => current_user.id)
		params[:employees].each do |employee_id|
			project.employees << Employee.find_by_id(employee_id)
		end if params[:employees]
		
		if !params[:employee].empty?
			project.employees << Employee.create(:name => params[:employee], :business_id => current_user.id)
		end
		
		params[:supplies].each do |supply_id|
			project.supplies << Supply.find_by_id(supply_id)
		end if params[:supplies]
		
		if !params[:supply].empty?
			project.supplies << Supply.create(:name => params[:supply], :business_id => current_user.id)
		end
		
		project.save
		redirect '/projects'
	end
	
	get '/projects/:id/edit' do 
		redirect_if_not_logged_in
		@project = Project.find(params[:id])
		erb :"/projects/edit"
	end
	
	patch '/projects/:id' do 
		redirect_if_not_logged_in
		project = Project.find(params[:id])
		project.update(params[:project])
		if !params[:employee].empty?
			project.employees << Employee.create(:name => params[:employee], :business_id => current_user.id)
		end
		if !params[:supply].empty?
			project.supplies << Supply.create(:name => params[:supply], :business_id => current_user.id)
		end
		project.save
		redirect '/projects'
	end
	
	delete '/projects/:id' do 
		redirect_if_not_logged_in
		Project.find_by_id(params[:id]).destroy
		redirect '/projects'
	end
	
end