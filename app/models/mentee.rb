class Mentee < ApplicationRecord
    has_many :matches
    has_many :mentors, through: :matches
    has_one_attached :avatar
    validates :major, presence: true
    validates :length_of_mentorship, presence: true

    def majors
        subjects_hash = {}
        count = 0
        subject_list = JSON.parse(File.read('./db/subject.json'))
        subject_list.each do |subject|
            subjects_hash[subject["id"]] = subject["name"]
        end
        return subjects_hash
    end

end
