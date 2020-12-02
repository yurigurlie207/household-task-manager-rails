class SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: :create

  def new
  end

  def create
 
    if request.env['omniauth.auth']
      # pp request.env['omniauth.auth']
      session[:name] = request.env['omniauth.auth']['info']['nickname']
      session[:omniauth_data] = request.env['omniauth.auth']

      @user = User.find_by(username: session[:name])

      if !@user
        @user = User.create(username: session[:name], password: session[:name], email: session[:omniauth_data]['info']['email'] )
        render 'new' unless @user.save
      end
      session[:user_id] = @user.id
      
    else

      @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])

      if !params[:username] || params[:username].empty? || !@user
        return render 'new', notice: "wrong username and/or password"
      else
        session[:name] = params[:username]
        session[:user_id] = @user.id
      end

    end

    redirect_to @user
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end

end
