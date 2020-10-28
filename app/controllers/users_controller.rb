class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new]

    #this route is for development/testing purposes
    def index
    end

    def new
    end
   
    def create
      @user = User.create(user_params)
      return redirect_to controller: 'users', action: 'new' unless @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'userhome'
    end

    def userhome
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
   
    def require_login
      return head(:forbidden) unless session.include? :user_id
    end


  # get '/user/signup' do
  #   if !logged_in?
  #     erb :'/user/signup'
  #   else
  #     redirect to '/user/userhome'
  #   end
  # end


  # post '/signup' do
  #   usernames = User.all.collect { |user| user.username }

  #   if params['user']['username'] == "" || params['user']['password'] == ""
  #     flash.now[:error] = "please make sure you have a username and password"
  #     erb :'/user/signup'
  #   elsif usernames.include?(params['user']['username'])
  #     flash.now[:error] = "username already exists"
  #     erb :'/user/signup'
  #   else
  #     @user = User.create(params["user"])
  #     session[:user_id] = @user.id
  #     redirect to "/user/#{@user.id}"
  #   end
  # end

  # post '/login' do
  #  user = User.find_by(:username => params['user']['username'])
  #  if user && user.authenticate(params['user']['password'])
  #    session[:user_id] = user.id
  #    redirect to "/user/userhome"
  #  else
  #    flash.now[:error] = "incorrect login or password"
  #    erb :'/user/login'
  #  end
  # end

  # get '/user/:id/edit' do
  #   if !logged_in?
  #     erb :'/user/login'
  #   else
  #     @user = current_user
  #     erb :'/user/edit'
  #   end
  # end

  # patch '/user/:id' do
  #   if !logged_in?
  #     erb :'/user/login'
  #   else
  #     @user = current_user
  #     @user.update(params['user'])
  #     redirect to "/user/#{@user.id}"
  #   end
  # end

  # delete '/user/:id/delete' do
  #    if !logged_in?
  #      erb :'/user/login'
  #   else
  #     @user = current_user
  #     @user.delete
  #     redirect to '/user/signup'
  #   end
  # end

  # get '/user/logout' do
  #     if logged_in?
  #       session.destroy
  #       redirect to '/user/login'
  #     else
  #       redirect to '/'
  #     end
  # end

  # get '/user/:id' do
  #   if !logged_in?
  #     erb :'/user/login'
  #    else
  #      #This is really a route feature for debugging, so current user helper not used
  #       @user = User.find_by_id(params[:id])
  #       erb :'/user/profile'
  #   end
  # end


end
