class User < ApplicationRecord
has_many :user_cocktails
has_many :cocktails, through: :user_cocktails


end
