class CombinationsController < ApplicationController


    def index 
        combinations = Combination.all 
        render json: combinations, include: [:ingredient, :measure, :cocktail]
    end 


end
