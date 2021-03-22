class Mentee < ApplicationRecord
    has_many :mentors
    has_many :mentors, through: :matches
end
