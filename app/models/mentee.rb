class Mentee < ApplicationRecord
    has_many :mentors
    has_many :mentors, through: :matches
    has_one_attached :avatar
end
