# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



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
    
    # ingredients_array = []
    # for i in 1..15
    #     ingredients_array << cocktail_drink_array[0]["strIngredient#{i}"]

        
    #     puts(ingredients_array)
    # end 
    
    
    
    cocktail.save
    
    puts(cocktail.method)

    #after id: 100, method = null
    #measure and ingredients 
end




    