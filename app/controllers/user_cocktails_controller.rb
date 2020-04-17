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

    def update
        usercocktail = UserCocktail.find(params[:id])
        usercocktail.update(notes: params[:notes])
        render json: usercocktail, include: [:user, :cocktail]
    end   

    def destroy
        usercocktail = UserCocktail.find(params[:id])
        usercocktail.destroy
        render json: usercocktail, include: [:user, :cocktail]
    end 

   
#     @article = Article.find(params[:id])
#     @article.update(title: params[:article][:title], description: params[:article][:description])
#     redirect_to article_path(@article)
#   end
    private 

    def user_cocktail_params 
        params.require(:user_cocktail).permit(:user_id, :cocktail_id, :notes)
    end 

    


end
