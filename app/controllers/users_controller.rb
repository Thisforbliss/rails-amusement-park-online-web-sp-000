class UsersController < ApplicationController

    def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
        #binding.pry
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else 
          redirect_to 'new'
        end 
      end
    
    def show
      #binding.pry
      if logged_in?
      @user = User.find_by(id: params[:id])
      else
        redirect_to "/"
      end
      
    end

    def user_params
        params.require(:user).permit(
        :name,
        :height,
        :tickets,
        :happiness,
        :nausea,
        :admin,
        :password
        )
    end
end
