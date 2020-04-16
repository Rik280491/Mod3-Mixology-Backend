class AddNotesToUserCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :user_cocktails, :notes, :string
  end
end
