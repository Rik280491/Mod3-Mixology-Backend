class AddDrinkIdToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :drinkId, :string
  end
end
