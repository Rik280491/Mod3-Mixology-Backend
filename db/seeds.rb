Recipe.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

require 'rest-client'

rm = RestClient.get 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'

ctAPI_array = JSON.parse(rm)["drinks"]


ctAPI_array.each do |drink| 
    Cocktail.create(
        name: drink["strDrink"],
        img_url: drink["strDrinkThumb"],
        drinkId: drink["idDrink"]
    )
end

Cocktail.all.each do |cocktail|
    cocktail_drink = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{cocktail.drinkId}"

    cocktail_drink_array = JSON.parse(cocktail_drink)["drinks"]
    
    cocktail.method = cocktail_drink_array[0]["strInstructions"]

    for i in 1..15
        if (cocktail_drink_array[0]["strIngredient#{i}"] == nil) 
        else
            ingredient = Ingredient.find_by(name: cocktail_drink_array[0]["strIngredient#{i}"])
            recipe = Recipe.find_by(cocktail: cocktail, ingredient: ingredient)
            if (recipe)
            else
                if (ingredient)
                    Recipe.create(cocktail: cocktail, ingredient: ingredient)
                else
                    ing = Ingredient.create(name: cocktail_drink_array[0]["strIngredient#{i}"])
                    Recipe.create(cocktail: cocktail, ingredient: ing)
                end
            end
        end
    end
    
    cocktail.save

end




    