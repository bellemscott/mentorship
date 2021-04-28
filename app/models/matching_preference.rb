class MatchingPreference < ApplicationRecord

    def get_location
       return location
    end

    def get_common_subjects
        return common_subjects
    end

    def get_length_of_mentorship
        return length_of_mentorship
    end

end

#user.length_of_mentorship=false