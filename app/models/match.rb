class Match < ApplicationRecord
   belongs_to :mentee
   belongs_to :mentor

   #accepts a match
    def accept(accepted,other_match)
        puts "in accept"
        puts other_match.id
        if self.update_attribute(:accepted, accepted)
            puts "Success! accepted"
        else
           puts "Failed to update record. Handle the error."
        end
        puts "see this b"
        ApplicationController.helpers.update_match(other_match.user_id, other_match)
    end

    #rejects a match
    def reject(rejected)
      if self.update_attribute(:rejected, rejected)
          puts "Success! rejected"
      else
         puts "Failed to update record. Handle the error."
      end
  end


  def get_full_jobs
   return Profession::Profession.list
  end
 
   
end
 




  



