Combination.destroy_all
Cocktail.destroy_all
Measure.destroy_all
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
        ing = cocktail_drink_array[0]["strIngredient#{i}"]
        mea = cocktail_drink_array[0]["strMeasure#{i}"]

        if (ing == nil)
        else
            ingredient = Ingredient.find_by(name: ing)
            measure = Measure.find_by(amount: mea)
            comb = Combination.find_by(ingredient: ingredient, measure: measure, cocktail: cocktail)

            if (comb)
            else
                if (ingredient)
                    if (measure)
                        Combination.create(ingredient: ingredient, measure: measure, cocktail: cocktail)
                    else
                        measure = Measure.create(amount: mea)
                        Combination.create(ingredient: ingredient, measure: measure, cocktail: cocktail)
                    end
                else
                    ingredient = Ingredient.create(name: ing)
                    if (measure)
                        Combination.create(ingredient: ingredient, measure: measure, cocktail: cocktail)
                    else
                        measure = Measure.create(amount: mea)
                        Combination.create(ingredient: ingredient, measure: measure, cocktail: cocktail)
                    end
                end
            end
        end

    end
    
    cocktail.save

end




    