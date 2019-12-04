class UsersController < ApplicationController

    def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    
    def show
        #binding.pry
        @user = User.find(params[:id])
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
