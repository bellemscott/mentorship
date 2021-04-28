class Mentor < ApplicationRecord
    has_many :matches
    has_many :mentees, through: :matches
    has_one_attached :avatar
    validates :current_position, presence: true 
    validates :length_of_mentorship, presence: true

    def get_full_jobs
        return Profession::Profession.list
    end

    def search_by_term(search_term)
        return Profession::Profession.match(search_term)
    end
end
