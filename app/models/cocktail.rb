class Cocktail < ApplicationRecord
    has_many :user_cocktails
    has_many :users, through: :user_cocktails
    # has_many :recipes
    # has_many :ingredients, through: :recipes
    has_many :combinations
    has_many :ingredients, through: :combinations
    has_many :measures, through: :combinations
end
