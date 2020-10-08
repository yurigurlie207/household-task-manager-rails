class ApplicationController < ActionController::Base

      get '/' do
        erb :index
      end
    
      helpers do
        def logged_in?
          !!current_user
        end
    
        def current_user
          @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end
    
        def can_edit?(subtasks)
          subtasks.each do |subtask|
            subtask.users.each do |user|
                if session[:user_id] == user.id
                    @can_edit = true
                 end
              end
          end
    
          @can_edit ||= false
        end
    
      end

      end

      protect_from_forgery with: :exception

  before_action :current_user

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id != nil
  end

  def require_logged_in
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end

end
