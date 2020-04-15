class UserCocktailsController < ApplicationController

    def index
        usercocktails = UserCocktail.all 
        render json: usercocktails, include: [:user, :cocktail]
    end 


    def show 
        usercocktail = UserCocktail.find(params[:id])
        render json: usercocktail, include: [:user, :cocktail]
    end

    def create
        usercocktail = UserCocktail.create(user_cocktail_params)
        render json: usercocktail, include: [:user, :cocktail]
    end 




    private 

    def user_cocktail_params 
        params.require(:user_cocktail).permit(:user_id, :cocktail_id)
    end 

    


end
