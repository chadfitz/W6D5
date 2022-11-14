require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    
    CAT_COLORS = ["White", "Black", "Ginger", "Grey", "Brown", "Tabby"].freeze

    validates :color, inclusion: CAT_COLORS
    validates :sex, inclusion: %w[M F]
    validates :birth_date, :name, presence: true
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date > Date.today
            errors.add(:birth_date, "can't be in the future")
        end
    end
end
