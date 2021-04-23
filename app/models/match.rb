class Match < ApplicationRecord
   belongs_to :mentee
   belongs_to :mentor

   #accepts a match
    def accept(accepted)
        if self.update_attribute(:accepted, accepted)
            puts "Success!"
        else
           puts "Failed to update record. Handle the error."
        end
    end

    #rejects a match
    def reject(rejected)
      if self.update_attribute(:rejected, rejected)
          puts "Success!"
      else
         puts "Failed to update record. Handle the error."
      end
  end

       
    def helper(major,job)
      if @major_map.has_key?(major)
          @major_map[major].push(job)
       else 
          @major_map[major]=[]
          @major_map[major].push(job)
       end
  end

  def get_full_jobs
   return Profession::Profession.list
  end

  def get_hash
      return @major_map
  end

  
 
    #accepts a match
     def accept(accepted)
         if self.update_attribute(:accepted, accepted)
             puts "Success!"
         else
            puts "Failed to update record. Handle the error."
         end
     end
 
     #rejects a match
     def reject(rejected)
       if self.update_attribute(:rejected, rejected)
           puts "Success!"
       else
          puts "Failed to update record. Handle the error."
       end
   end
 
        
     def helper(major,job)
       if @major_map.has_key?(major)
           @major_map[major].push(job)
        else 
           @major_map[major]=[]
           @major_map[major].push(job)
        end
   end
 
   def get_full_jobs
    return Profession::Profession.list
   end
 
   def get_hash
       return @major_map
   end
 
   def make_map 
       @major_map= Hash.new()
       jobs_list = get_full_jobs()
       jobs_list.each do |j|
            if j.include? "Account" or j.include? "Audit" or j.include? "Bursar" or j.include? "Claims" or j.include? "Investment" or j.include? "Underwriter"
               if @major_map.has_key?("Business")
                   @major_map["Business"].push(j)
                else 
                   @major_map["Business"]=[]
                   @major_map["Business"].push(j)
                end
                if @major_map.has_key?("Economics")
                   @major_map["Economics"].push(j)
                else 
                   @major_map["Economics"]=[]
                   @major_map["Economics"].push(j)
                end
                if @major_map.has_key?("International Business School")
                   @major_map["International Business School"].push(j)
                else 
                   @major_map["International Business School"]=[]
                   @major_map["International Business School"].push(j)
                 end
            end
 
             if j.include? "Actuary"
                 if @major_map.has_key?("Business")
                     @major_map["Business"].push(j)
                  else 
                     @major_map["Business"]=[]
                     @major_map["Business"].push(j)
                  end
                  if @major_map.has_key?("Economics")
                     @major_map["Economics"].push(j)
                  else 
                     @major_map["Economics"]=[]
                     @major_map["Economics"].push(j)
                  end
                  if @major_map.has_key?("Mathematics")
                     @major_map["Mathematics"].push(j)
                  else 
                     @major_map["Mathematics"]=[]
                     @major_map["Mathematics"].push(j)
                   end
                   if @major_map.has_key?("International Business School")
                     @major_map["International Business School"].push(j)
                  else 
                     @major_map["International Business School"]=[]
                     @major_map["International Business School"].push(j)
                   end
             end
             if j.include? "Acoustic" or j.include? "Opera" or j.include? "Orchestral" or j.include? "Song" or j.include? "Sound" 
                 if @major_map.has_key?("Music")
                     @major_map["Music"].push(j)
                  else 
                     @major_map["Music"]=[]
                     @major_map["Music"].push(j)
                  end
                  if @major_map.has_key?("Creativity, the Arts, and Social Transformation")
                     @major_map["Creativity, the Arts, and Social Transformation"].push(j)
                  else 
                     @major_map["Creativity, the Arts, and Social Transformation"]=[]
                     @major_map["Creativity, the Arts, and Social Transformation"].push(j)
                  end
       
             end
 
             if j.include? "Actor" or j.include? "Stage"
                 if @major_map.has_key?("Film, Televsion, and Interactive Media")
                     @major_map["Film, Televsion, and Interactive Media"].push(j)
                  else 
                     @major_map["Film, Televsion, and Interactive Media"]=[]
                     @major_map["Film, Televsion, and Interactive Media"].push(j)
                  end
                  if @major_map.has_key?("Theater Arts")
                     @major_map["Theater Arts"].push(j)
                  else 
                     @major_map["Theater Arts"]=[]
                     @major_map["Theater Arts"].push(j)
                  end
                  if @major_map.has_key?("Creativity, the Arts, and Social Transformation")
                     @major_map["Creativity, the Arts, and Social Transformation"].push(j)
                  else 
                     @major_map["Creativity, the Arts, and Social Transformation"]=[]
                     @major_map["Creativity, the Arts, and Social Transformation"].push(j)
                  end
       
             end
 
             if j.include? "Actress" or j.include? "Cinema"
                 if @major_map.has_key?("Film, Televsion, and Interactive Media")
                     @major_map["Film, Televsion, and Interactive Media"].push(j)
                  else 
                     @major_map["Film, Televsion, and Interactive Media"]=[]
                     @major_map["Film, Televsion, and Interactive Media"].push(j)
                  end
                  if @major_map.has_key?("Theater Arts")
                     @major_map["Theater Arts"].push(j)
                  else 
                     @major_map["Theater Arts"]=[]
                     @major_map["Theater Arts"].push(j)
                  end
                  if @major_map.has_key?("Creativity, the Arts, and Social Transformation")
                     @major_map["Creativity, the Arts, and Social Transformation"].push(j)
                  else 
                     @major_map["Creativity, the Arts, and Social Transformation"]=[]
                     @major_map["Creativity, the Arts, and Social Transformation"].push(j)
                  end
       
             end
 
             if j.include? "Acupuct"
                 if @major_map.has_key?("Health: Science, Soceity, and Policy")
                     @major_map["Health: Science, Soceity, and Policy"].push(j)
                  else 
                     @major_map["Health: Science, Soceity, and Policy"]=[]
                     @major_map["Health: Science, Soceity, and Policy"].push(j)
                  end
               
             end
 
             if j.include? "Adjuster"
                 if @major_map.has_key?("Business")
                     @major_map["Business"].push(j)
                  else 
                     @major_map["Business"]=[]
                     @major_map["Business"].push(j)
                  end
                  if @major_map.has_key?("Economics")
                     @major_map["Economics"].push(j)
                  else 
                     @major_map["Economics"]=[]
                     @major_map["Economics"].push(j)
                  end
                  if @major_map.has_key?("International Business School")
                     @major_map["International Business School"].push(j)
                  else 
                     @major_map["International Business School"]=[]
                     @major_map["International Business School"].push(j)
                   end
              end
         
 
              if j.include? "Admin" or j.include? "Negotiator" 
                 if @major_map.has_key?("Business")
                     @major_map["Business"].push(j)
                  else 
                     @major_map["Business"]=[]
                     @major_map["Business"].push(j)
                  end
                  if @major_map.has_key?("International Business School")
                     @major_map["International Business School"].push(j)
                  else 
                     @major_map["International Business School"]=[]
                     @major_map["International Business School"].push(j)
                   end
              end
 
              if j.include? "Advertising"
                 if @major_map.has_key?("Business")
                     @major_map["Business"].push(j)
                  else 
                     @major_map["Business"]=[]
                     @major_map["Business"].push(j)
                  end
              end
 
               if j.include? "Aerial erector" or j.include? "Percision Engenieer"
                  if @major_map.has_key?("Physics")
                      @major_map["Physics"].push(j)
                   else 
                      @major_map["Physics"]=[]
                      @major_map["Physics"].push(j)
                   end
                   if @major_map.has_key?("Computer Science")
                      @major_map["Computer Science"].push(j)
                   else 
                      @major_map["Computer Science"]=[]
                      @major_map["Computer Science"].push(j)
                   end
               end
 
               if j.include? "Aerobic Instrcutor"
                  if @major_map.has_key?("Health: Science, Soceity, and Policy")
                      @major_map["Health: Science, Soceity, and Policy"].push(j)
                   else 
                      @major_map["Health: Science, Soceity, and Policy"]=[]
                      @major_map["Health: Science, Soceity, and Policy"].push(j)
                   end
               
              end
 
              if j.include? "Aeron" or j.include?"Electric" or j.include?"Mechanic" or j.include? "physicist" or j.include? "mechanic" 
                    helper("Physics",j)
              end
 
              if j.include? "Agent" or j.include? "Theat"
                  if @major_map.has_key?("Film, Televsion, and Interactive Media")
                      @major_map["Film, Televsion, and Interactive Media"].push(j)
                   else 
                      @major_map["Film, Televsion, and Interactive Media"]=[]
                      @major_map["Film, Televsion, and Interactive Media"].push(j)
                   end
                   if @major_map.has_key?("Theater Arts")
                      @major_map["Theater Arts"].push(j)
                   else 
                      @major_map["Theater Arts"]=[]
                      @major_map["Theater Arts"].push(j)
                   end
                   if @major_map.has_key?("Creativity, the Arts, and Social Transformation")
                      @major_map["Creativity, the Arts, and Social Transformation"].push(j)
                   else 
                      @major_map["Creativity, the Arts, and Social Transformation"]=[]
                      @major_map["Creativity, the Arts, and Social Transformation"].push(j)
                   end
       
              end
 
              if j.include? "Air" #&& j!= "Airport Manager"
                  if j!= "Airport Manager"
                     if @major_map.has_key?("Physics")
                         @major_map["Physics"].push(j)
                     else 
                         @major_map["Physics"]=[]
                         @major_map["Physics"].push(j)
                     end
                 end
              end
 
              if j.include? "Manager"  or j.include? "Business" or j.include? "Owner" or j.include? "Gamble" or j.include? "Operator" or j.include? "Merch"
                  if @major_map.has_key?("Business")
                     @major_map["Business"].push(j)
                   else 
                      @major_map["Business"]=[]
                      @major_map["Business"].push(j)
                   end
               
              end

              if j.include? "Almoner" 
                 if @major_map.has_key?("Business")
                    @major_map["Business"].push(j)
                  else 
                     @major_map["Business"]=[]
                     @major_map["Business"].push(j)
                  end
                  if @major_map.has_key?("Sociology")
                     @major_map["Sociology"].push(j)
                   else 
                      @major_map["Sociology"]=[]
                      @major_map["Sociology"].push(j)
                   end
                  if @major_map.has_key?("Health: Science, Soceity, and Policy")
                     @major_map["Health: Science, Soceity, and Policy"].push(j)
                  else 
                     @major_map["Health: Science, Soceity, and Policy"]=[]
                     @major_map["Health: Science, Soceity, and Policy"].push(j)
                  end
             end
 
             if j.include? "Ambulance" 
                 if @major_map.has_key?("lecular and Cell BiologMoy")
                    @major_map["Molecular and Cell Biology"].push(j)
                  else 
                     @major_map["Molecular and Cell Biology"]=[]
                     @major_map["Molecular and Cell Biology"].push(j)
                  end
                  if @major_map.has_key?("Health: Science, Soceity, and Policy")
                     @major_map["Health: Science, Soceity, and Policy"].push(j)
                  else 
                     @major_map["Health: Science, Soceity, and Policy"]=[]
                     @major_map["Health: Science, Soceity, and Policy"].push(j)
                  end
                  if @major_map.has_key?("Neuroscince")
                     @major_map["Neuroscince"].push(j)
                  else 
                     @major_map["Neuroscince"]=[]
                     @major_map["Neuroscince"].push(j)
                  end
                  if @major_map.has_key?("Postbaccalaureate Premed Studies")
                     @major_map["Postbaccalaureate Premed Studies"].push(j)
                  else 
                     @major_map["Postbaccalaureate Premed Studies"]=[]
                     @major_map["Postbaccalaureate Premed Studies"].push(j)
                  end
             end
 
             if j.include? "Amusement" or j.include? "Choreographer" or j.include? "Circus" or j.include? "Entertainer" or j.include? "Magician" or j.include? "Producer" or j.include? "Production" or j.include? "Projecctionist" or j.include? "Show" or j.include? "Director" or j.include? "Ventriloquist"
                 if @major_map.has_key?("Theater Arts")
                    @major_map["Theater Arts"].push(j)
                  else 
                     @major_map["Theater Arts"]=[]
                     @major_map["Theater Arts"].push(j)
                  end
             end
 
             if j == "Analyst"
                  if @major_map.has_key?("Business")
                     @major_map["Business"].push(j)
                  else 
                     @major_map["Business"]=[]
                     @major_map["Business"].push(j)
                  end
                  if @major_map.has_key?("Economics")
                     @major_map["Economics"].push(j)
                  else 
                     @major_map["Economics"]=[]
                     @major_map["Economics"].push(j)
                  end
             end
 
             if j.include? "Chem" or j.include? "chem"
                 if @major_map.has_key?("Chemistry")
                    @major_map["Chemistry"].push(j)
                  else 
                     @major_map["Chemistry"]=[]
                     @major_map["Chemistry"].push(j)
                  end
             end
           
             if j.include? "Anesthetics" 
                 if @major_map.has_key?("Molecular and Cell Biology")
                    @major_map["Molecular and Cell Biology"].push(j)
                  else 
                     @major_map["Molecular and Cell Biology"]=[]
                     @major_map["Molecular and Cell Biology"].push(j)
                  end
                  if @major_map.has_key?("Health: Science, Soceity, and Policy")
                     @major_map["Health: Science, Soceity, and Policy"].push(j)
                  else 
                     @major_map["Health: Science, Soceity, and Policy"]=[]
                     @major_map["Health: Science, Soceity, and Policy"].push(j)
                  end
                  if @major_map.has_key?("Neuroscince")
                     @major_map["Neuroscince"].push(j)
                  else 
                     @major_map["Neuroscince"]=[]
                     @major_map["Neuroscince"].push(j)
                  end
                  if @major_map.has_key?("Postbaccalaureate Premed Studies")
                     @major_map["Postbaccalaureate Premed Studies"].push(j)
                  else 
                     @major_map["Postbaccalaureate Premed Studies"]=[]
                     @major_map["Postbaccalaureate Premed Studies"].push(j)
                  end
             end
 
             if j.include? "Breeder" or j.include? "Florist"
                 if @major_map.has_key?("Biology")
                     @major_map["Biology"].push(j)
                   else 
                      @major_map["Biology"]=[]
                      @major_map["Biology"].push(j)
                   end
                 if @major_map.has_key?("Molecular and Cell Biology")
                    @major_map["Molecular and Cell Biology"].push(j)
                  else 
                     @major_map["Molecular and Cell Biology"]=[]
                     @major_map["Molecular and Cell Biology"].push(j)
                  end
                  if @major_map.has_key?("Genetic Counseling")
                     @major_map["Genetic Counseling"].push(j)
                   else 
                      @major_map["Genetic Counseling"]=[]
                      @major_map["Genetic Counseling"].push(j)
                   end
             end
 
             if j.include? "Anthro" 
                 if @major_map.has_key?("Anthropology")
                    @major_map["Anthropology"].push(j)
                  else 
                     @major_map["Anthropology"]=[]
                     @major_map["Anthropology"].push(j)
                  end
             end
 
 
             if j.include? "Dealer" or j.include? "Auction" or j.include? "Steward" or j.include? "Clerk" or j.include? "Buyer" or j.include? "Salesman" or j.include? "Retailer" or j.include? "Consultant" or j.include? "broker"
                 if @major_map.has_key?("Business")
                    @major_map["Business"].push(j)
                  else 
                     @major_map["Business"]=[]
                     @major_map["Business"].push(j)
                  end
             end
 
             if j.include? "Applications" or j.include? "IT" or j.include? "Type"
                 if @major_map.has_key?("Computer Science")
                    @major_map["Computer Science"].push(j)
                  else 
                     @major_map["Computer Science"]=[]
                     @major_map["Computer Science"].push(j)
                  end
             end
 
             if j.include? "Arbitrator" or j.include? "Warden"
                 if @major_map.has_key?("Peace, Conflict, and Coexistance Studies")
                    @major_map["Peace, Conflict, and Coexistance Studies"].push(j)
                  else 
                     @major_map["Peace, Conflict, and Coexistance Studies"]=[]
                     @major_map["Peace, Conflict, and Coexistance Studies"].push(j)
                  end
                  if @major_map.has_key?("Legal Studies")
                     @major_map["Legal Studies"].push(j)
                   else 
                      @major_map["Legal Studies"]=[]
                      @major_map["Legal Studies"].push(j)
                   end
             end
 
             if j.include? "Arborist" 
                 if @major_map.has_key?("Molecular and Cell Biology")
                    @major_map["Molecular and Cell Biology"].push(j)
                  else 
                     @major_map["Molecular and Cell Biology"]=[]
                     @major_map["Molecular and Cell Biology"].push(j)
                  end
             end
 
             if j.include? "Archaeologist"  or j.include? "China Restorer" or j.include? "Museum"
                 if @major_map.has_key?("History")
                    @major_map["History"].push(j)
                  else 
                     @major_map["History"]=[]
                     @major_map["History"].push(j)
                  end
                  if @major_map.has_key?("History of Ideas")
                     @major_map["History of Ideas"].push(j)
                   else 
                      @major_map["History of Ideas"]=[]
                      @major_map["History of Ideas"].push(j)
                   end
                  if @major_map.has_key?("Greek")
                     @major_map["Greek"].push(j)
                   else 
                      @major_map["Greek"]=[]
                      @major_map["Greek"].push(j)
                   end
                   if @major_map.has_key?("Russian")
                     @major_map["Russian"].push(j)
                   else 
                      @major_map["Russian"]=[]
                      @major_map["Russian"].push(j)
                   end
                   if @major_map.has_key?("Latin")
                     @major_map["Latin"].push(j)
                   else 
                      @major_map["Latin"]=[]
                      @major_map["Latin"].push(j)
                   end
                   if @major_map.has_key?("Classical Studies")
                     @major_map["Classical Studies"].push(j)
                   else 
                      @major_map["Classical Studies"]=[]
                      @major_map["Classical Studies"].push(j)
                   end
                   if @major_map.has_key?("Romance")
                     @major_map["Romance"].push(j)
                   else 
                      @major_map["Romance"]=[]
                      @major_map["Romance"].push(j)
                   end
             end

            if j.include? "Installer" or j.include? "Restorer" or j.include? "Site Engenieer" or j.include? "Scaffolder" or  j.include? "Build"  or j.include? "Contracter" or j.include? "Fixer" or j.include? "Fitter" and j!= "Body Fitter"
                 if @major_map.has_key?("Architectural Studies")
                     @major_map["Architectural Studies"].push(j)
                 else 
                     @major_map["Architectural Studies"]=[]
                     @major_map["Architectural Studies"].push(j)
                 end
             end
 
             if j.include? "Architect"  
                 helper("Physics",j)
                 helper("Studio Art",j)
                 helper("Architectural Studies",j)
             end
 
             if j.include? "Archivist" 
                 if @major_map.has_key?("History")
                    @major_map["History"].push(j)
                  else 
                     @major_map["History"]=[]
                     @major_map["History"].push(j)
                  end
                  if @major_map.has_key?("History of Ideas")
                     @major_map["History of Ideas"].push(j)
                   else 
                      @major_map["History of Ideas"]=[]
                      @major_map["History of Ideas"].push(j)
                   end
             end
 
             if j.include? "Armorer" 
                 if @major_map.has_key?("Biotechnology")
                    @major_map["Biotechnology"].push(j)
                  else 
                     @major_map["Biotechnology"]=[]
                     @major_map["Biotechnology"].push(j)
                  end
                  if @major_map.has_key?("Biotechnology")
                     @major_map["Biotechnology"].push(j)
                   else 
                      @major_map["Biotechnology"]=[]
                      @major_map["Biotechnology"].push(j)
                   end
             end
 
 
             if j.include? "Therapist" or j.include? "therapist" or j.include? "Hypono" 
                 if @major_map.has_key?("Health: Science, Soceity, and Policy")
                    @major_map["Health: Science, Soceity, and Policy"].push(j)
                  else 
                     @major_map["Health: Science, Soceity, and Policy"]=[]
                     @major_map["Health: Science, Soceity, and Policy"].push(j)
                  end
                  if @major_map.has_key?("Physcology")
                     @major_map["Biotechnology"].push(j)
                   else 
                      @major_map["Biotechnology"]=[]
                      @major_map["Biotechnology"].push(j)
                   end
             end
 
 
             if j.include? "Art" or j.include? "Baloonist" or j.include? "Maker" or j.include? "Cartoon" or j.include? "Comissioned" or j.include? "Decorator" or j.include? "Aranger" or j.include? "Art" or j.include? "Ornamental" or j.include? "Potter" 
                 if @major_map.has_key?("Studio Art")
                    @major_map["Studio Art"].push(j)
                  else 
                     @major_map["Studio Art"]=[]
                     @major_map["Studio Art"].push(j)
                  end
                  if @major_map.has_key?("Fine Art")
                     @major_map["Fine Art"].push(j)
                   else 
                      @major_map["Fine Art"]=[]
                      @major_map["Fine Art"].push(j)
                   end
                   if @major_map.has_key?("Sculpture")
                     @major_map["Sculpture"].push(j)
                   else 
                      @major_map["Sculpture"]=[]
                      @major_map["Sculpture"].push(j)
                   end
             end
 
             if j.include? "Assesor" or j.include? "Bank"
                 if @major_map.has_key?("Business")
                     @major_map["Business"].push(j)
                  else 
                     @major_map["Business"]=[]
                     @major_map["Business"].push(j)
                  end
                  if @major_map.has_key?("Economics")
                     @major_map["Economics"].push(j)
                  else 
                     @major_map["Economics"]=[]
                     @major_map["Economics"].push(j)
                  end
                  if @major_map.has_key?("International Business School")
                     @major_map["International Business School"].push(j)
                  else 
                     @major_map["International Business School"]=[]
                     @major_map["International Business School"].push(j)
                   end
              end
 
              if j.include? "Care" or j.include? "Teacher" or j.include? "Child" or j.include? "Class" or j.include? "Counselor" or j.include? "Playgroup" or j.include? "Registrar" or j.include? "School" or j.include? "Tutor"
                 if @major_map.has_key?("Education")
                    @major_map["Education"].push(j)
                  else 
                     @major_map["Education"]=[]
                     @major_map["Education"].push(j)
                  end
             end
 
           
             if j.include? "Nurse" and j.exclude? "Nursery" or j.include? "Audiologist" or "Chiro" or j.include? "Doctor" or j.include? "Practitioner" or j.include? "Gynaecologist" or j.include? "Phram" or j.include? "Medical" or j.include? "Midwive" or j.include? "Optic" or j.include? "Optometrist" 
                 if @major_map.has_key?("Molecular and Cell Biology")
                     @major_map["Molecular and Cell Biology"].push(j)
                   else 
                      @major_map["Molecular and Cell Biology"]=[]
                      @major_map["Molecular and Cell Biology"].push(j)
                   end
                   if @major_map.has_key?("Health: Science, Soceity, and Policy")
                      @major_map["Health: Science, Soceity, and Policy"].push(j)
                   else 
                      @major_map["Health: Science, Soceity, and Policy"]=[]
                      @major_map["Health: Science, Soceity, and Policy"].push(j)
                   end
                   if @major_map.has_key?("Neuroscince")
                      @major_map["Neuroscince"].push(j)
                   else 
                      @major_map["Neuroscince"]=[]
                      @major_map["Neuroscince"].push(j)
                   end
                   if @major_map.has_key?("Postbaccalaureate Premed Studies")
                      @major_map["Postbaccalaureate Premed Studies"].push(j)
                   else 
                      @major_map["Postbaccalaureate Premed Studies"]=[]
                      @major_map["Postbaccalaureate Premed Studies"].push(j)
                   end
             end
           
             if j.include? "Astro" or j.include? "Astro" or j.include? "Civil Engenieer" or j.include? "Heating Engenieer" or j.include? "Miner Engenieer" or j.include? "Thermal"
                 if @major_map.has_key?("Physics")
                     @major_map["Physics"].push(j)
                  else 
                     @major_map["Physics"]=[]
                     @major_map["Physics"].push(j)
                  end
             end
         
             if j.include? "Athlet" or j.include? "Footballer" or j.include? "Remover" or j.include? "Restorer" or j.include? "Golf" or j.include? "Fit" or j.include? "Outdoors" or j.include? "Pack" or j.include? "Shoot" or j.include? "Track" or j.include? "Trainee" or j.include? "Training"
                 if @major_map.has_key?("Physical Education")
                     @major_map["Physical Education"].push(j)
                  else 
                     @major_map["Physical Education"]=[]
                     @major_map["Physical Education"].push(j)
                  end
             end
         
             if j.include? "Attendant"  or j.include?"Au Pair" or j.include?"Lecturer" or j.include?"Speech" or j.include?"Special Needs"
                 if @major_map.has_key?("Education")
                    @major_map["Education"].push(j)
                  else 
                     @major_map["Education"]=[]
                     @major_map["Education"].push(j)
                  end
             end
 
 
             if j.include? "Care" or j.include? "Youth"
                 if @major_map.has_key?("Education")
                    @major_map["Education"].push(j)
                  else 
                     @major_map["Education"]=[]
                     @major_map["Education"].push(j)
                  end
             end
 
             if j.include? "Curer" or  j.include?"Baker"
                 if @major_map.has_key?("Chemistry")
                    @major_map["Chemistry"].push(j)
                  else 
                     @major_map["Chemistry"]=[]
                     @major_map["Chemistry"].push(j)
                  end
             end
 
           
             if j.include? "Bailiff" or j.include? "Barrister" or j.include? "Civil Servant" or j.include? "Councilor" or j.include? "Foreman" or j.include? "Inspector" or j.include? "Law"  or j.include? "Legal" or j.include? "Litigat" 
                 if @major_map.has_key?("Legal Studies")
                     @major_map["Legal Studies"].push(j)
                   else 
                      @major_map["Legal Studies"]=[]
                      @major_map["Legal Studies"].push(j)
                   end
             end
 
             if j.include? "Minister" or j.include? "Chap" or j.include? "Church" or j.include? "Clergy" or j.include? "Cleric" or j.include? "Nun" or j.include? "Preacher" or j.include? "Priest" or j.include? "Rector" or j.include? "Verger" or j.include? "Vicar"
                 if @major_map.has_key?("Religous Studies")
                     @major_map["Religous Studies"].push(j)
                   else 
                      @major_map["Religous Studies"]=[]
                      @major_map["Religous Studies"].push(j)
                   end
             end
 
             if j.include? "Bar" and j!="Barrister" or j.include? "Worker" or j.include? "Auction" or j.include? "Shop" or j.include? "Poster" or j.include? "Caller" or j.include? "Hairdresser" or j.include? "Handy" or  j.include? "Lumber"
                 if @major_map.has_key?("Independant Interdisciplanary Major")
                    @major_map["Independant Interdisciplanary Major"].push(j)
                  else 
                     @major_map["Independant Interdisciplanary Major"]=[]
                     @major_map["Independant Interdisciplanary Major"].push(j)
                  end
             end
 
             if j.include? "Beaut"   or  j.include? "Litnographer" or j.include? "Marble"  or j.include? "Painter" or j.include? "Pattern" or j.include? "Picture" or j.include? "Tatoo" or j.include? "Weave" or j.include? "Wood"
                 if @major_map.has_key?("Studio Art")
                    @major_map["Studio Art"].push(j)
                  else 
                     @major_map["Studio Art"]=[]
                     @major_map["Studio Art"].push(j)
                  end
                  if @major_map.has_key?("Fine Art")
                     @major_map["Fine Art"].push(j)
                   else 
                      @major_map["Fine Art"]=[]
                      @major_map["Fine Art"].push(j)
                   end
             end
 
             if j.include? "Bio" or j.include? "bio" or j.include? "Nuclear"
                 if @major_map.has_key?("Biology")
                    @major_map["Biology"].push(j)
                  else 
                     @major_map["Biology"]=[]
                     @major_map["Biology"].push(j)
                  end
                  if @major_map.has_key?("Biological Physics")
                     @major_map["Biological Physics"].push(j)
                   else 
                      @major_map["Biological Physics"]=[]
                      @major_map["Biological Physics"].push(j)
                   end
                   if @major_map.has_key?("Biochemistry")
                     @major_map["Biochemistry"].push(j)
                   else 
                      @major_map["Biochemistry"]=[]
                      @major_map["Biochemistry"].push(j)
                   end
             end
 
             if j.include? "Smith"  or j.include? "Assembler" or  j.include? "Brewer" or  j.include? "Brick" or  j.include? "Mort"
                 if @major_map.has_key?("Independant Interdisciplanary Major")
                    @major_map["Independant Interdisciplanary Major"].push(j)
                  else 
                     @major_map["Independant Interdisciplanary Major"]=[]
                     @major_map["Independant Interdisciplanary Major"].push(j)
                  end
             end
 
             if j.include? "Body"  or j.include? "Trainer" or j.include? "Jockey" or j.include? "Life" or j.include? "Lift" or j.include? "Motor Rider" or j.include? "Boxer" or j.include? "Racer" or j.include? "Wrestler"
                 if @major_map.has_key?("Physical Education")
                    @major_map["Physical Education"].push(j)
                  else 
                     @major_map["Physical Education"]=[]
                     @major_map["Physical Education"].push(j)
                  end
             end
 
             if j.include? "Liter" or j.include? "Libra" or j.include? "Book"  and j.exclude? "Booking" or j.include? "Words"  and j.exclude? "Writing"
                 if @major_map.has_key?("University Writing (COMP and UWS)")
                    @major_map["University Writing (COMP and UWS)"].push(j)
                  else 
                     @major_map["University Writing (COMP and UWS)"]=[]
                     @major_map["University Writing (COMP and UWS)"].push(j)
                  end
                  if @major_map.has_key?("English")
                     @major_map["English"].push(j)
                   else 
                      @major_map["English"]=[]
                      @major_map["English"].push(j)
                   end
                   if @major_map.has_key?("Creative Writing")
                     @major_map["Creative Writing"].push(j)
                   else 
                      @major_map["Creative Writing"]=[]
                      @major_map["Creative Writing"].push(j)
                   end
                   if @major_map.has_key?("Comparative Literature and Culture")
                     @major_map["Comparative Literature and Culture"].push(j)
                   else 
                      @major_map["Comparative Literature and Culture"]=[]
                      @major_map["Comparative Literature and Culture"].push(j)
                   end
             end
 
             if j.include? "Botanist" 
                 if @major_map.has_key?("Biology")
                    @major_map["Biology"].push(j)
                  else 
                     @major_map["Biology"]=[]
                     @major_map["Biology"].push(j)
                  end
             end
 
             if j.include? "Broadcast" or j.include? "Interview" or j.include? "Journal" or j.include? "Press" or j.include? "Radio" or j.include? "Report"
                 if @major_map.has_key?("Journalism")
                    @major_map["Journalism"].push(j)
                  else 
                     @major_map["Journalism"]=[]
                     @major_map["Journalism"].push(j)
                  end
             end
 
             if j.include? "Bar" or j.include? "Driver" or j.include? "Valet" or j.include? "Company" or j.include? "Conducter" or j.include? "Butcher" or j.include? "Butler" or j.include? "Kennel Hand"
                 if @major_map.has_key?("Independant Interdisciplanary Major")
                    @major_map["Independant Interdisciplanary Major"].push(j)
                  else 
                     @major_map["Independant Interdisciplanary Major"]=[]
                     @major_map["Independant Interdisciplanary Major"].push(j)
                  end
             end
 
             if j.include? "Staff" or j.include? "Caterer" or j.include?  "Cashier" or j.include? "Car" and j.exclude? "Care" and j.exclude? "Cart"
                 if @major_map.has_key?("Independant Interdisciplanary Major")
                    @major_map["Independant Interdisciplanary Major"].push(j)
                  else 
                     @major_map["Independant Interdisciplanary Major"]=[]
                     @major_map["Independant Interdisciplanary Major"].push(j)
                  end
             end
 
             if j.include? "Cartographer"  or j.include? "Hort" or j.include? "Meteor"
                 if @major_map.has_key?("Environmental Studies")
                    @major_map["Environmental Studies"].push(j)
                  else 
                     @major_map["Environmental Studies"]=[]
                     @major_map["Environmental Studies"].push(j)
                  end
             end
         
             if j.include? "Caulker" or j.include? "Celler" or  j.include? "Chamber" or  j.include? "Chandler" or  j.include? "Chaufer" or  j.include? "Chef" or  j.include? "Chicken" or j.include? "Sweep" or j.include? "Clairvoyant" or j.include? "Cleaner" or j.include? "Messeger"
                 if @major_map.has_key?("Independant Interdisciplanary Major")
                    @major_map["Independant Interdisciplanary Major"].push(j)
                  else 
                     @major_map["Independant Interdisciplanary Major"]=[]
                     @major_map["Independant Interdisciplanary Major"].push(j)
                  end
             end
 
             if j.include? "Charge Hand" or j.include?"Charter" or j.include?"Inventor" or j.include?"License" or j.include?"Shop"
                 if @major_map.has_key?("Business")
                     @major_map["Business"].push(j)
                   else 
                      @major_map["Business"]=[]
                      @major_map["Business"].push(j)
                   end
             end
 
             if j.include? "Coroner" or j.include? "Investigator" or j.include? "Judge"
                 if @major_map.has_key?("Legal Studies")
                     @major_map["Legal Studies"].push(j)
                   else 
                      @major_map["Legal Studies"]=[]
                      @major_map["Legal Studies"].push(j)
                   end
 
                   if @major_map.has_key?("Justice Brandeis Semester")
                     @major_map["Justice Brandeis Semester"].push(j)
                   else 
                      @major_map["Justice Brandeis Semester"]=[]
                      @major_map["Justice Brandeis Semester"].push(j)
                   end
             end
 
             if j.include? "Editor" or j.include? "Proof Reader" or j.include? "Publish"
                 if @major_map.has_key?("University Writing (COMP and UWS)")
                    @major_map["University Writing (COMP and UWS)"].push(j)
                  else 
                     @major_map["University Writing (COMP and UWS)"]=[]
                     @major_map["University Writing (COMP and UWS)"].push(j)
                  end
                  if @major_map.has_key?("English")
                     @major_map["English"].push(j)
                   else 
                      @major_map["English"]=[]
                      @major_map["English"].push(j)
                   end
                   if @major_map.has_key?("Creative Writing")
                     @major_map["Creative Writing"].push(j)
                   else 
                      @major_map["Creative Writing"]=[]
                      @major_map["Creative Writing"].push(j)
                   end
                   if @major_map.has_key?("Comparative Literature and Culture")
                     @major_map["Comparative Literature and Culture"].push(j)
                   else 
                      @major_map["Comparative Literature and Culture"]=[]
                      @major_map["Comparative Literature and Culture"].push(j)
                   end
                   if @major_map.has_key?("Journalism")
                     @major_map["Journalism"].push(j)
                   else 
                      @major_map["Journalism"]=[]
                      @major_map["Journalism"].push(j)
                   end
             end
 
             if j == "Engenieer" or j == "Motor Engenieer"
                 if @major_map.has_key?("Physics")
                     @major_map["Physics"].push(j)
                  else 
                     @major_map["Physics"]=[]
                     @major_map["Physics"].push(j)
                  end
                  if @major_map.has_key?("Mathematics") 
                     @major_map["Mathematics"].push(j)
                  else 
                     @major_map["Mathematics"]=[]
                     @major_map["Mathematics"].push(j)
                  end
              end
 
              if j.include? "Envoy" 
                 if @major_map.has_key?("International and Global Studies")
                     @major_map["International and Global Studies"].push(j)
                   else 
                      @major_map["International and Global Studies"]=[]
                      @major_map["International and Global Studies"].push(j)
                   end
             end
 
             if j.include? "Executive" or j.include? "Hotelier" or j.include? "Manufacturer" or j.include? "Meter Reader" or j.include? "Money" or j.include? "Broker" or j.include? "Tax" and j.exclude? "Taxi"
                 if @major_map.has_key?("Business")
                    @major_map["Business"].push(j)
                  else 
                     @major_map["Business"]=[]
                     @major_map["Business"].push(j)
                  end
             end
 
             if j.include? "Farmer" or j.include? "Fire" or  j.include? "Floor" or  j.include? "Flour" or  j.include? "Foam" or  j.include? "Food" or  j.include? "Forest" or j.include? "Fruit" or j.include? "Funeral" or j.include? "Funernace"
                 if @major_map.has_key?("Independant Interdisciplanary Major")
                    @major_map["Independant Interdisciplanary Major"].push(j)
                  else 
                     @major_map["Independant Interdisciplanary Major"]=[]
                     @major_map["Independant Interdisciplanary Major"].push(j)
                  end
             end
 
             if j.include? "Parent" or j.include? "Instructor"
                helper("Education",j)
             end
 
             if j.include? "French" 
                 helper("French and Francone Studies",j)
             end
  
             if j.include? "Fund" or j.include? "Loans" or j.include? "Loss" or j.include? "Sales" or j.include? "Stock" or j.include? "Treasurer" or j.include? "Valuer"
                 helper("Business",j)
                 helper("Economics",j)
                 helper( "International Business School",j)
             end
 
             if j.include? "Furrier" or j.include? "Game" or j.include? "Gardener" or j.include? "Gas" or j.include? "Keeper" or j.include? "Handler" or j.include? "Technition" or j.include? "Grave" or j.include? "Grocer" or j.include? "Groom"
                 helper("Independant Interdisciplanary Major",j)
             end
 
             if j.include? "Designer" or  j.include? "Guilder" or  j.include? "Glass" or  j.include? "Glazier" or  j.include? "Print" or j.include? "Illustrator" or j.include? "Decoratator" or j.include? "Joiner"
                 helper("Fine Art",j)
                 helper("Studio",j)
             end
           
             if j.include? "Gene" 
                helper("Biology",j)
                helper("Molecular and Cell Biology",j)
                helper("Anthropology",j)
                helper("Global Studies",j)
             end
 
             if j.include? "Geologist" or j.include? "Mineralogist" or j.include? "Paleo"
                 helper("Biology",j)
                 helper("Molecular and Cell Biology",j)
                 helper("Environmental Studies ",j)
              end
           
              if j.include? "Gov" or j.include? "Representive" or j.include? "Town"
                 helper("Politics",j)
                 helper("Global Studies",j)
                 helper("International and Global Studies",j)
              end
 
              if j.include? "Graphologist" 
                 helper("Physcology",j)
                 helper("Creative Writng",j)
              end
 
              if j.include? "Green" or j.include? "Ground" or j.include? "Map" or j.include? "Marine" or j.include? "Meteorologist"
                 helper("Environmental Studies ",j)
              end
 
              if j.include? "Proprietor" or j.include? "Hawker" or j.include? "Land" or j.include? "Market" or j.include? "Controller" or j.include? "sale" or j.include? "Supervisor" or j.include? "Service" or j.include? "Store" or j.include? "Telecomm" or j.include? "market" or j.include? "sales"
                 helper("Business",j)
              end
              if j.include? "Health" or j.include? "Hearing" or j.include? "Hospitol" or j.include? "Hygenist" or j.include? "Medical" or j.include? "Radiographer" or j.include? "Reflexologist" or j.include? "Surgeon" or j.include? "Trichologist"
                  helper("Health: Science, Soceity, and Policy",j)
                  helper("Biology",j)
                  helper("Postbaccalaureate Premed Studies",j)
             end
             if j.include? "Herbalist" or j.include? "Carrier" or j.include? "Home" or j.include? "Host" or j.include? "House" or j.include? "Vendor" or j.include?"Import" or j.include?"Mower"
                 helper("Independant Interdisciplanary Major",j)
             end
 
             if j.include? "Histor"
                 helper("History",j)
                 helper("History of Ideas",j)
                 helper("Medieval and Renaissance Studies",j)
                 helper("Italian Studies",j)
                 helper("German Studies",j)
                 helper("Latin American and Latio Studies",j)
                 helper("Russian Studies",j)
                 helper("Islamic and Middle Eastern Studies",j)
                 helper("Near Eastern and Judaic Studies",j)
                 helper("International and Global Studies",j)
                 helper("East Asian Studies",j)
                 helper("Classical",j)
                 helper("American Studies",j)
                 helper("African and Afro-American Studies",j)
                 helper("South Asian Studies",j)
                 helper("Art History",j)
                 helper("Russian Studies",j)
                 helper("Romance Studies",j)
             end
 
             if j.include? "Econ" or j.include? "Independent Means"
                 helper("Economics",j)
             end
 
             if j.include? "Housing" or "Immigration"
                 helper("Social Justice and Social Policy",j)
                 helper("Sociology",j)
             end
 
              if j.include? "Moulder" or j.include? "monger" or j.include? "Janitor" or j.include? "Laborer" or j.include? "Laminator" or j.include? "Distrib" or j.include? "Light" or j.include? "Line" or j.include? "Lock"
                 helper("Independant Interdisciplanary Major",j)
             end
 
             if j.include? "Instrument" or j.include? "Jazz" or j.include? "Jewler" or j.include? "Organ" or j.include? "Piano" or j.include? "Violin"
                 helper("Music",j)
             end
 
             if j.include? "Insurance" 
                 helper("Business",j)
                 helper("Health: Science, Soceity, and Policy",j)
             end
 
             if j.include? "Payroll"  or j.include? "Rent" or j.include? "Revenue" or j.include? "Wadge"
                 helper("Business",j)
             end
 
             if j.include? "Interperator" 
                 helper("Yidish",j)
                 helper("Greek",j)
                 helper("Latin",j)
                 helper("Korean",j)
                 helper("Chinesse",j)
                 helper("Arabic Langue and Literature",j)
                 helper("Hebrew",j)
                 helper("Japanesse",j)
                 helper("Langue and Linguistics",j)
                 helper("Portuguese",j)
 
             end
             if j.include? "Knit" or j.include? "Photo" or j.include? "Portfolio"
                 helper("Fine Art",j)
                 helper("Studio Art",j)
             end

             if j.include? "Mach" or j.include? "Maid" or j.include? "Manicurist" or j.include? "Marquee" or j.include? "Matron" or j.include? "Metal" 
                 helper("Independant Interdisciplanary Major",j)
             end
 
             if j.include? "Magistrate" or j.include? "Shelter" or j.include? "Sheiff"
                 helper("Legal Studies",j)
             end
 
             if j.include? "Marble"
                 helper("Fine Art",j)
                 helper("Studio",j)
             end
 
             if j.include? "Mass" 
                 helper("Health: Science, Soceity, and Policy",j)
             end
 
             if j.include? "Math" or j.include? "Stat"
                 helper("Mathematics",j)
              end
 
             if j.include? "Matron" or j.include? "Metal" or j.include? "Matress" or j.include? "Meat" or j.include? "Mill" or j.include? "Mine" or j.include? "Night" or j.include? "Shore" or j.include? "Oil" 
                 helper("Independant Interdisciplanary Major",j)
             end
           
            if j.include? "Nanny" or j.include? "Nursery"
               helper("Education",j)
            end
 
            if j.include? "Navigator"
                helper("International and Global Studies",j)
            end
 
            if j.include? "Neuro"
                helper("Neuroscience",j)
                helper("Biology",j)
                helper("Postbaccalaureate Premed Studies",j)
            end
 
            if j.include? "News"
             helper("Journalism",j)
             helper("International and Global Studies",j)
           end
 
           if j.include? "Nutrition"
             helper("Health: Science, Soceity, and Policy",j)
             helper("Biology",j)
           end
 
           if j.include? "Nutrition"
             helper("Health: Science, Soceity, and Policy",j)
             helper("Biology",j)
           end
 
           if j.include? "Organizer"
              helper("Business",j)
              helper("Sociology",j)
           end
 
           if j.include? "Ornithologist"
             helper("Biology",j)
             helper("Quantitative Biology",j)
             helper("Environmental Studies",j)
           end
 
           if j.include? "Osteo" or j.include? "Orthoped" or j.include? "Peadiatrician" or j.include? "Pain" or j.include? "medic" or j.include? "Pathologist" or j.include? "Physician" or j.include? "Podiatrist"
               helper("Molecular and Cell Biology",j)
               helper("Health: Science, Soceity, and Policy",j)
               helper("Neuroscince",j)
               helper("Postbaccalaureate Premed Studies",j)
           end
 
           if j.include? "Pallet" or j.include? "Panel" or j.include? "Park" or j.include? "Part" or j.include? "Partition" or j.include? "Patrol" or j.include? "Officer" or j.include? "Minder" or j.include? "Pig" or j.include? "Poilsh" or j.include? "Pig" or j.include? "Pool" or j.include? "Porter"
             helper("Independant Interdisciplanary Major",j)
           end
 
         if j.include? "Patent" or j.include? "Police" or j.include? "Prison" or j.include? "Probation"
             helper("Legal Studies",j)
         end
 
         if j.include? "Phillatelist"
             helper("History",j)
         end
 
         if j.include? "Physict" or j.include? "Technicain" or j.include? "Engenieer" and j.exclude? "Computer"
             helper("Physics",j)
         end
 
         if j.include? "Physo"
             helper("Physcology",j)
         end
 
         if j.include? "Pig" or j.include? "Pilot" or j.include? "Plant" or j.include? "Pipe" or j.include? "Planning" or j.include? "Plaster" or j.include? "Plate" or j.include? "Plumber" 
             helper("Independant Interdisciplanary Major",j)
         end
 
         if j.include? "Porter" or j.include? "Post" or j.include? "Plant" or j.include? "Pipe" or j.include? "Planning" or j.include? "Plaster" or j.include? "Plate" or j.include? "Plumber" or j.include? "Pursuer" 
             helper("Independant Interdisciplanary Major",j)
         end
 
         if j.include? "Premises" or j.include? "Programmer"
             helper("Computer Science",j)
         end
 
         if j.include? "Procurator Fiscal" 
             helper("Business",j)
             helper("Legal Studies",j)
         end
 
         if j.include? "Production Engenieer" 
             helper("Business",j)
             helper("Physics",j)
         end
 
         if j.include? "Progress" or j.include? "Project" or j.include? "Promoter" or j.include? "Property" or j.include? "Propietor" or j.include? "Public Relations" or j.include? "Publician" or j.include? "Purchase" or j.include? "Quality" or j.include? "Quantity" or j.include? "Refuse Collector" 
             helper("Business",j)
         end
         
         if j.include? "Race" or  j.include? "Racing" or  j.include? "Recreational" or  j.include? "Riding" or  j.include? "Security" or  j.include? "Shot" or  j.include? "Sport" or  j.include? "Tennis"
             helper("Physical Education",j)
         end
         
         if j.include? "Recpetionist" or j.include? "Recorder" or j.include? "Vehical" or j.include? "Repair" or j.include? "Restaurant" or j.include? "Retired" or j.include? "Rig" or j.include? "Riveter" or j.include? "Roof" or j.include? "Rose" or j.include? "Road" or j.include? "Royal" or j.include? "Rug" or j.include? "Saddler" 
             helper("Independant Interdisciplanary Major",j)
         end
 
         if j.include? "Engenieer" and j.exclude? "Software"
              helper("Physics",j)
              helper("Mathematics",j)
         end
 
         if j.include? "Regulator" 
             helper("Biology",j)
             helper("Molecular and Cell Biology",j)
             helper("Health: Science, Soceity, and Policy",j)
             helper("Heller School for Social Policy and Management",j)
         end
 
        if j.include? "Reseach" or j.include? "Scienc"
             helper("Biology",j)
             helper("Molecular and Cell Biology",j)
             helper("Chemisty",j)
             helper("Physics",j)
             helper("Quantitive Biology",j)
             helper("Biotechnology",j)
             helper("Biophysics and Structural Biology",j)
        end
 
        if j.include? "Resin Caster" 
         helper("Sculpter",j)
        end
 
         if j.include? "Sail" or j.include? "Sand" or j.include? "Saw" or j.include? "Seaman" or j.include? "Seam" or j.include? "Servant" or j.include? "Shelf" or j.include? "Shepard" or j.include? "Shift" or j.include? "Ship" or j.include? "Shoe"
             helper("Independant Interdisciplanary Major",j)
         end
 
 
        if j.include? "Screen" 
             helper("Theater Arts",j)
             helper("Creative Writing",j)
             helper("University Writing (COMP and UWS)",j)
             helper("English",j)
             helper("Film, Televsion, and Interactive Media",j)
        end
 
        if j.include? "Sculpter" 
             helper("Sculpture",j)
        end
 
        if j.include? "Secretary" 
             helper("Business",j)
             helper("English",j)
        end
 
        if j.include? "Shunter" or j.include? "Sign" or j.include? "Signal" or j.include? "Skipper" or j.include? "Slater" or j.include? "Slaughter" or j.include? "Soldier" or j.include? "Soliciter" or j.include? "Constable" or j.include? "Stable" or j.include? "Steel" or j.include? "Steeple"
             helper("Independant Interdisciplanary Major",j)
        end
 
         if j.include? "Smallholder" 
             helper("Business",j)
             helper("Biology",j)
         end
 
         if j.include? "Social" 
             helper("Sociology",j)
             helper("Education",j)
             helper("Women, Gender, and Sexuality Studies",j)
             helper("Sexuality and Queer Studies",j)
         end
 
         if j.include? "Software" or j.include? "Techni"
             helper("Computer Science",j)
             helper("Systems",j)
         end
 
         if j.include? "Stenographer" 
             helper("Legal Studies",j)
             helper("English",j)
         end
 
         if j.include? "Steward" or j.include? "Stone" or j.include? "Street" or j.include? "Stud" or j.include? "Student" or j.include? "Sub-Post" or j.include? "Survey" or j.include? "Soliciter" or j.include? "Constable" or j.include? "Stable" or j.include? "Steel" or j.include? "Steeple"
             helper("Independant Interdisciplanary Major",j)
        end
 
        if j.include? "Studio" 
             helper("Theater Studies",j)
             helper("Music",j)
             helper("Fine Art",j)
             helper("Studio Art",j)
         end
 
       if j.include? "TV" or j.include? "Video"
         helper("Film, Televsion, and Interactive Media",j)
       end
 
       if j.include? "Tank" or j.include? "Tanner" or j.include? "Tailor" or j.include? "Tacker" or j.include? "Taxi" or j.include? "Tea" or j.include? "Telegraph" or j.include? "Telephonist" or j.include? "Temperature" or j.include? "Texile" or j.include? "Thatcher" or j.include? "Ticker" or j.include? "Tiler" or j.include? "Timber" or j.include? "Tire" or j.include? "Tabbac" or j.include? "Toll"  or j.include? "Tool"
         helper("Independant Interdisciplanary Major",j)
       end
 
       if j.include? "Tour"
         helper("Histroy",j)
         helper("Internaional and Global Studdies",j)
       end
 
       if j.include? "Toy" or j.include? "Tractor" or j.include? "Trad" or j.include? "Traffic" or j.include? "Transport" or j.include? "Tree" or j.include? "Tunnel" or j.include? "Turner" or j.include? "Undertaker" or j.include? "Upholsterer" or j.include? "Vehical" or j.include? "Wait" or j.include? "Wherehouse" or j.include? "Watch" or j.include? "Welder" or j.include? "Wheel" or j.include? "Wind"  or j.include? "Yacht" or j.include? "Yard"
         helper("Independant Interdisciplanary Major",j)
       end
 
       if j.include? "Transcriber or Translator"
          helper("Yidish",j)
          helper("Greek",j)
          helper("Latin",j)
          helper("Korean",j)
          helper("Chinesse",j)
          helper("Arabic Langue and Literature",j)
          helper("Hebrew",j)
          helper("Japanesse",j)
          helper("Langue and Linguistics",j)
          helper("Portuguese",j)
          helper("Near Eastern and Judiac Studies ",j)
       end
 
       if j.include? "Travel"
         helper("Architectural Studies",j)
         helper("Internaional and Global Studdies",j)
         helper("Near Eastern and Judiac Studies ",j)
         helper("Islamic and Middle Eastern Studies",j)
         helper("History",j)
         helper("Italian Studies",j)
         helper("German Studies",j)
         helper("Latin American and Latio Studies",j)
         helper("Russian Studies",j)
         helper("East Asian Studies",j)
         helper("African and Afro-American Studies",j)
         helper("South Asian Studies",j)
         helper("Art History",j)
         helper("Russian Studies",j)
         helper("Romance Studies",j)
       end
 
       if j.include? "Welfare"
           helper("Business",j)
           helper("Economics",j)
           helper("Sociology",j)
       end
 
       if j.include? "Zoo"
         helper("Biology",j)
         helper("Environmental Studies",j)
       end
 
 
     end
 end 
 
 
 def get_map
     return @major_map
 end
 
end
 




  



