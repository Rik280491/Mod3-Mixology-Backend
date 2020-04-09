class CreateCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :img_url
      t.text :method

      t.timestamps
    end
  end
end
