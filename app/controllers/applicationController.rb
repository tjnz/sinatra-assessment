class ApplicationController < Sinatra::Base

	configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "sinatra-secrets"
  end
  
  get '/' do 
  	@businesses = Business.all[0..1]
  	erb :index
  end
  
  get '/signup' do 
  	if logged_in? 
  		redirect '/businesses'
  	else
			erb :'/businesses/new'
		end
	end
  
  post '/signup' do 
    user = Business.new(:name => params[:name], 
                            :username => params[:username], 
                            :password => params[:password])
    if user.save
      session[:user_id] = user.id
      redirect '/businesses'
    else
      redirect '/signup'
    end
  end
  
  get '/login' do 
  	if logged_in?
  		redirect '/businesses'
  	else
      @error_message = params[:error]
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
  
  get '/logout' do 
    if logged_in? 
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end
  
  helpers do 
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=You have to be logged in to do that"
      end
    end
    
  	def logged_in?
  		!!session[:user_id]
  	end
  	
  	def current_user
  		Business.find(session[:user_id])
  	end
    
    def valid_params?(params)
      params.all? do |key, value|
        value.length > 0
      end
    end
  	
  end
  
end