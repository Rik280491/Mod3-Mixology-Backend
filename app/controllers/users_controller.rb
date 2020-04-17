class UsersController < ApplicationController

    def index 
        users = User.all 
        render json: users, include: [:cocktails, :user_cocktails]
    end 


    def create 
        user = User.create(user_params)
        render json: user, include: [:cocktails, :user_cocktails]
    end

    def show 
        user = User.find(params[:id])
        render json: user, include: [:cocktails, :user_cocktails]
    end 



    private 

    def user_params 
        params.require(:user).permit(:username)
    end
end
