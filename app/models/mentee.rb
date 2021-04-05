class Mentee < ApplicationRecord
    has_many :matches
    has_many :mentors, through: :matches
    has_one_attached :avatar

    def majors
        subjects_hash = {}
        #subject_columns = [:subjectid, :name, :abbreviation]
        count = 0
        subject_list = JSON.parse(File.read('./db/subject.json'))
        subject_list.each do |subject|
            subjects_hash[subject["id"]] = subject["name"]
        end
        return subjects_hash
    end
        # subject_list.each do |subject|
            # subjects_array << (name: subject["name"], subjectid: subject["id"])
    #Subject.create(subject.except('segments').to_h)

end
