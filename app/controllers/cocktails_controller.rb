class CocktailsController < ApplicationController

    def index 
        cocktails = Cocktail.all.first(100) 
        render json: cocktails, include: [:users, :ingredients, :measures]

    end 

    def show 
        cocktail = Cocktail.find(params[:id])

        render json: cocktail, includes: [:users, :combinations]

    end 

        

end
