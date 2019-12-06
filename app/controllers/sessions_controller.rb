class SessionsController < ApplicationController

    def new
        #binding.pry
        @user = User.new
        @users = User.all
    end

    def create
        #binding.pry
        @user = User.find_by(:name => params[:user][:name])
        #binding.pry
            if @user
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                render 'new'
            end
    end
    
   
end
