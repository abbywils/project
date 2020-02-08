class Country < ApplicationRecord
    has_many :sites
    validates :states_name, :region, presence: true
end
