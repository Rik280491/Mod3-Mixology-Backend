class CocktailsController < ApplicationController

    def index 
        cocktails = Cocktail.all.first(99) 
        render json: cocktails
    end 

    def show 
        cocktail = Cocktail.find(params[:id])
        render json: cocktail
    end 

        

end
