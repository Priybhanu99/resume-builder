class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            @profile = Profile.create(user_id: @user.id)
            flash[:success] = "User Created!"
            redirect_to login_path
        else
            flash[:danger] = "Unable to create new user"
            redirect_to login_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
