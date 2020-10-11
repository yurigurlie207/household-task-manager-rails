class StaticController < ApplicationController
    def home
        redirect_to controller: 'user', action: 'userhome' unless !session[:user_id]
    end
end