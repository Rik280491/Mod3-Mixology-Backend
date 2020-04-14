class Combination < ApplicationRecord
  belongs_to :measure
  belongs_to :ingredient
  belongs_to :cocktail
end
