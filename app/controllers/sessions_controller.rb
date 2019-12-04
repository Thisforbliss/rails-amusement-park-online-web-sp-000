class SessionsController < ApplicationController

    def new
        #binding.pry
        @user = User.new
        @users = User.all
    end

    def create
        #binding.pry
        @user = User.find_by(:name => params[:user][:name])
            if @user
                session[:user_id] = @user.id
                redirect_to 'show'
            else
                render 'new'
            end
    end
    
    def show

    end
end
