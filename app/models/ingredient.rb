class Ingredient < ApplicationRecord
    # has_many :recipes
    # has_many :cocktails, through: :recipes
    has_many :combinations
    has_many :measures, through: :combinations
    has_many :cocktails, through: :combinations
end
