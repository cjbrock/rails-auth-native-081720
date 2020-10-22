class Sushi < ApplicationRecord
    has_many :ingredients, dependent: :destroy
    accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? ||  attributes['calories'].blank?  || attributes['serving_size'].blank? }

    validates :name, presence: true, uniqueness: true
    validate :starts_with_x


    def created_time
        self.created_at.strftime("%b %e -- %l:%M %p")
    end

    # def ingredients_attributes=(ing_attr)
    #     ing_attr.values.each do |ingredient|
    #         #check that all the fields are filled out
    #         if ingredient['name'] != "" && ingredient['calories'] != "" && ingredient['serving_size'] != ""
    #             #create a new ingredient with an association to the sushi
    #             # ing = Ingredient.new(ingredient)
    #             # ing.sushi_id = self.id
    #                 # OR
    #             self.ingredients.build(ingredient)
    #         end
    #     end
    # end


    private

    def starts_with_x
        if name != "" && name[0].downcase == "x"
            errors.add(:x, "cannot be the first letter")
        end
    end


end
