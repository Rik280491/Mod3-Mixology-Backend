class UsersController < ApplicationController

    def index 
        users = User.all 
        render json: users, includes: [:cocktails]
    end 


    def create 
        user = User.create(user_params)
        render json: user, includes: [:cocktails]
    end

    def show 
        user = User.find(params[:id])
        render json: user, includes: [:cocktails]
    end 



    private 

    def user_params 
        params.require(:user).permit(:username)
    end
end
