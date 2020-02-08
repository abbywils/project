class Site < ApplicationRecord
    validates :name_en, :short_description_en, :date_inscribed,:longitude,:latitude, presence: true
    
end
