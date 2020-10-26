class Ingredient < ApplicationRecord
  belongs_to :sushi, optional: true
end
