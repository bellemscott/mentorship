class Mentor < ApplicationRecord
    has_many :matches
    has_many :mentees, through: :matches
    has_one_attached :avatar
    #belongs_to :user
end
