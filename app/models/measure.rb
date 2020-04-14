class Measure < ApplicationRecord
    has_many :combinations
    has_many :ingredients, through: :combinations
    has_many :cocktails, through: :combinations
end
