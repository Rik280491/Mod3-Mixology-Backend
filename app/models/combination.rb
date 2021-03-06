class Combination < ApplicationRecord
  belongs_to :measure
  belongs_to :ingredient
  belongs_to :cocktail

  validates_uniqueness_of :cocktail_id, :scope => [:ingredient_id, :measure_id]
end
