class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
  end

  def create
 
    if request.env['omniauth.auth']
      # pp request.env['omniauth.auth']
      session[:name] = request.env['omniauth.auth']['info']['name']
      session[:omniauth_data] = request.env['omniauth.auth']

      user = User.find_by(username: session[:name])
      return redirect_to(controller: 'users', action: 'create') unless user
      session[:user_id] = user.id
      # @user = user
    else
      return redirect_to(controller: 'sessions', action: 'new') if !params[:username] || params[:username].empty?
      session[:username] = params[:username]
      user = User.find_by(username: params[:username])
      user = user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      # @user = user
      # redirect_to '/users/' + session[:user_id].to_s
    end

    redirect_to '/users/' + session[:user_id].to_s
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end

end
