class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
  end

  def create
 
    if request.env['omniauth.auth']
      # pp request.env['omniauth.auth']
      session[:name] = request.env['omniauth.auth']['info']['name']
      session[:omniauth_data] = request.env['omniauth.auth']

      user = User.find_by(name: session[:name])
      return redirect_to(controller: 'users', action: 'create') unless user
      session[:user_id] = user.id
      @user = user
    else
      return redirect_to(controller: 'sessions', action: 'new') if !params[:name] || params[:name].empty?
      session[:name] = params[:name]
      user = User.find_by(name: params[:user][:name])
      user = user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      @user = user
      redirect_to controller: 'users', action: 'userhome'
    end

  
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end

end
