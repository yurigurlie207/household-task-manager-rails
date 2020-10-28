class StaticController < ApplicationController
    def home
        redirect_to controller: 'users', action: 'userhome' unless !session[:user_id]
    end
end