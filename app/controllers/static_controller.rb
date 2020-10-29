class StaticController < ApplicationController
    def home
        redirect_to '/users/' + session[:user_id].to_s unless !session[:user_id]
    end
end