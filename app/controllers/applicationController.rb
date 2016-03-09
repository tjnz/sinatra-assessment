class ApplicationController < Sinatra::Base

	configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "sinatra-secret"
  end
  
  get '/' do 
  	@businesses = Business.all
  	erb :index
  end
  
  get '/signup' do 
  	if logged_in? 
  		redirect '/businesses'
  	else
			erb :'businesses/new'
		end
	end
  
  get '/login' do 
  	if logged_in?
  		redirect '/businesses'
  	else
  		erb :'/businesses/login'
  	end
  end
  
  post '/login' do 
  	user = Business.find_by(:username => params[:username])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect '/businesses'
  	else
  		redirect '/login'
  	end
  end
  
  helpers do 
  	def logged_in?
  		!!session[:user_id]
  	end
  	
  	def current_user
  		Business.find([:user_id])
  	end
  	
  end
  
end