class UserCocktail < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail

  validates_uniqueness_of :user_id, :scope => :cocktail_id
end
