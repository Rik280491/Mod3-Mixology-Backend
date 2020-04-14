class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :cocktail, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
    end
  end
end
