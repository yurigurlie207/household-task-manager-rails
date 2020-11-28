

class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]
    #raise params.inspect/whatever.inspect for debugging
  before_action :set_user!, only: [:show, :edit, :update, :destroy]

    def index
    end

    def new
      @user = User.new
    end
   
    def create
      @user = User.create(user_params)
      render 'new' unless @user.save

      session[:user_id] = @user.id
      redirect_to @user

    end

    def show
      if session[:user_id]
        @user = User.find(session[:user_id])
        @usertasks = UserTask.where(user_id: @user.id)
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])

      @user.update(user_params)

      if @user.save
        redirect_to @user
      else
        render :edit
      end
    end


    def destroy
      session.delete :user_id
      @user = User.find(params[:id])
      @user.destroy
     
        # flash[:notice] = "Subtask deleted."
        redirect_to '/'
    end
  

    private
  
    def user_params
      params.require(:user).permit(:username, :firstname, :lastname, :email, :role, :birthdate, :password, :password_confirmation)
    end
   
    def require_login
      return head(:forbidden) unless session.include? :user_id
    end

    def set_user!
      @user = User.find(params[:id])
    end


end
