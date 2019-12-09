class SessionsController < ApplicationController

    def new
        #binding.pry
        @user = User.new
        @users = User.all
    end

    def create
        @user = User.find_by(:name => params[:user][:name])
            if @user
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                render 'new'
            end
    end

    def destroy
        if session[:name] == nil
            reset_session
            redirect_to root_path
        elsif current_user
            reset_session
            redirect_to root_path
        end
    end
    
   
end
