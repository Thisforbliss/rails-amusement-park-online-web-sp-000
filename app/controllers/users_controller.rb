class UsersController < ApplicationController

    def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
        #binding.pry
        if @user.save
          session[:user_id] = @user.id
          redirect_to 'show'
        else 
          redirect_to 'new'
        end 
      end
    
    def show
      #binding.pry
      if !current_user
        redirect_to 'new'
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
