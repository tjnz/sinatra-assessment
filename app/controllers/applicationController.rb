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
  
end