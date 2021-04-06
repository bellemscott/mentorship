class Match < ApplicationRecord
    belongs_to :mentee
    belongs_to :mentor

    def accept(accepted)
        if self.update_attribute(:accepted, accepted)
            puts "Success!"
        else
           puts "Failed to update record. Handle the error."
        end
    end
end
