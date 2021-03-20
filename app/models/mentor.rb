class Mentor < ApplicationRecord
    has_many :matches
    has_many :mentees, through: :matches
    #belongs_to :user
end
