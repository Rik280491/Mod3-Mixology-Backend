class IngredientsController < ApplicationController


    def index 
        ingredients = Ingredient.all 
        render json: ingredients, includes: [:cocktails]
    end 


end
