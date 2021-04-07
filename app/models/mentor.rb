class Mentor < ApplicationRecord
    has_many :matches
    has_many :mentees, through: :matches
    has_one_attached :avatar
    def get_full_jobs
        return Profession::Profession.list
    end

    def search_by_term(search_term)
        return Profession::Profession.match(search_term)
    end
end
