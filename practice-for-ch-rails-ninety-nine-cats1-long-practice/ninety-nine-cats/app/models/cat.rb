class Cat < ApplicationRecord
    CAT_COLORS = ["White", "Black", "Ginger", "Grey", "Brown", "Tabby"]

    validates :birth_date, :color, :name, :sex, presence: true
    validates :sex, inclusion:{ in: %w(M, F),
        message: "%{value} is not a valid sex" }
    validates :color, inclusion:{ in: CAT_COLORS.map(&:to_s),
        message: "%{value} is not a valid color"}
    validates birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date > Date.today
            errors.add(:birth_date, "can't be in the future")
        end
    end
end
