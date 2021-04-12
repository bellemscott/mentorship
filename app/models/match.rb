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
    
    def helper(major,job)
        if @major_map.has_key?(major)
            @major_map[major].push(job)
         else 
            @major_map[major]=[]
            @major_map[major].push(job)
         end
     end

    def make_map
        @major_map=hash.new()
        get_full_jobs.each do |j|
             if j.include? "Account" or j.include? "Audit" or j.include? "Bursar" or j.include? "Claims" or j.include? "Investment"
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
         
#              if j.include? "Actuary" 
#                 if @@major_map.has_key?("Business")
#                     @@major_map["Business"].push(j)
#                  else 
#                     @@major_map["Business"]=[]
#                     @@major_map["Business"].push(j)
#                  end
#                  if @@major_map.has_key?("Economics")
#                     @@major_map["Economics"].push(j)
#                  else 
#                     @@major_map["Economics"]=[]
#                     @@major_map["Economics"].push(j)
#                  end
#                  if @@major_map.has_key?("Mathematics")
#                     @@major_map["Mathematics"].push(j)
#                  else 
#                     @@major_map["Mathematics"]=[]
#                     @@major_map["Mathematics"].push(j)
#                   end
#                   if @@major_map.has_key?("International Business School")
#                     @@major_map["International Business School"].push(j)
#                  else 
#                     @@major_map["International Business School"]=[]
#                     @@major_map["International Business School"].push(j)
#                   end
#             end
#             if j.include? "Acoustic"
#                 if @@major_map.has_key?("Music")
#                     @@major_map["Music"].push(j)
#                  else 
#                     @@major_map["Music"]=[]
#                     @@major_map["Music"].push(j)
#                  end
#                  if @@major_map.has_key?("Creativity, the Arts, and Social Transformation")
#                     @@major_map["Creativity, the Arts, and Social Transformation"].push(j)
#                  else 
#                     @@major_map["Creativity, the Arts, and Social Transformation"]=[]
#                     @@major_map["Creativity, the Arts, and Social Transformation"].push(j)
#                  end
        
#             end

#             if j.include? "Actor"
#                 if @@major_map.has_key?("Film, Televsion, and Interactive Media")
#                     @@major_map["Film, Televsion, and Interactive Media"].push(j)
#                  else 
#                     @@major_map["Film, Televsion, and Interactive Media"]=[]
#                     @@major_map["Film, Televsion, and Interactive Media"].push(j)
#                  end
#                  if @@major_map.has_key?("Theater Arts")
#                     @@major_map["Theater Arts"].push(j)
#                  else 
#                     @@major_map["Theater Arts"]=[]
#                     @@major_map["Theater Arts"].push(j)
#                  end
#                  if @@major_map.has_key?("Creativity, the Arts, and Social Transformation")
#                     @@major_map["Creativity, the Arts, and Social Transformation"].push(j)
#                  else 
#                     @@major_map["Creativity, the Arts, and Social Transformation"]=[]
#                     @@major_map["Creativity, the Arts, and Social Transformation"].push(j)
#                  end
        
#             end

#             if j.include? "Actress" or j.include? "Cinema"
#                 if @@major_map.has_key?("Film, Televsion, and Interactive Media")
#                     @@major_map["Film, Televsion, and Interactive Media"].push(j)
#                  else 
#                     @@major_map["Film, Televsion, and Interactive Media"]=[]
#                     @@major_map["Film, Televsion, and Interactive Media"].push(j)
#                  end
#                  if @@major_map.has_key?("Theater Arts")
#                     @@major_map["Theater Arts"].push(j)
#                  else 
#                     @@major_map["Theater Arts"]=[]
#                     @@major_map["Theater Arts"].push(j)
#                  end
#                  if @@major_map.has_key?("Creativity, the Arts, and Social Transformation")
#                     @@major_map["Creativity, the Arts, and Social Transformation"].push(j)
#                  else 
#                     @@major_map["Creativity, the Arts, and Social Transformation"]=[]
#                     @@major_map["Creativity, the Arts, and Social Transformation"].push(j)
#                  end
        
#             end

#             if j.include? "Acupuct"
#                 if @@major_map.has_key?("Health: Science, Soceity, and Policy")
#                     @@major_map["Health: Science, Soceity, and Policy"].push(j)
#                  else 
#                     @@major_map["Health: Science, Soceity, and Policy"]=[]
#                     @@major_map["Health: Science, Soceity, and Policy"].push(j)
#                  end
                
#             end

#             if j.include? "Adjuster"
#                 if @@major_map.has_key?("Business")
#                     @@major_map["Business"].push(j)
#                  else 
#                     @@major_map["Business"]=[]
#                     @@major_map["Business"].push(j)
#                  end
#                  if @@major_map.has_key?("Economics")
#                     @@major_map["Economics"].push(j)
#                  else 
#                     @@major_map["Economics"]=[]
#                     @@major_map["Economics"].push(j)
#                  end
#                  if @@major_map.has_key?("International Business School")
#                     @@major_map["International Business School"].push(j)
#                  else 
#                     @@major_map["International Business School"]=[]
#                     @@major_map["International Business School"].push(j)
#                   end
#              end

#              if j.include? "Admin"
#                 if @@major_map.has_key?("Business")
#                     @@major_map["Business"].push(j)
#                  else 
#                     @@major_map["Business"]=[]
#                     @@major_map["Business"].push(j)
#                  end
#                  if @@major_map.has_key?("International Business School")
#                     @@major_map["International Business School"].push(j)
#                  else 
#                     @@major_map["International Business School"]=[]
#                     @@major_map["International Business School"].push(j)
#                   end
#              end

#              if j.include? "Advertising"
#                 if @@major_map.has_key?("Business")
#                     @@major_map["Business"].push(j)
#                  else 
#                     @@major_map["Business"]=[]
#                     @@major_map["Business"].push(j)
#                  end
#              end

              if j.include? "Aerial erector"
                 if @@major_map.has_key?("Physics")
                     @@major_map["Physics"].push(j)
                  else 
                     @@major_map["Physics"]=[]
                     @@major_map["Physics"].push(j)
                  end
                  if @@major_map.has_key?("Computer Science")
                     @@major_map["Computer Science"].push(j)
                  else 
                     @@major_map["Computer Science"]=[]
                     @@major_map["Computer Science"].push(j)
                  end
              end

              if j.include? "Aerobic Instrcutor"
                 if @@major_map.has_key?("Health: Science, Soceity, and Policy")
                     @@major_map["Health: Science, Soceity, and Policy"].push(j)
                  else 
                     @@major_map["Health: Science, Soceity, and Policy"]=[]
                     @@major_map["Health: Science, Soceity, and Policy"].push(j)
                  end
                
             end

             if j.include? "Aeron" or j.include?"Electric" or j.include?"Mechanic" or j.include? "physicist" 
                 if @@major_map.has_key?("Physics")
                     @@major_map["Physics"].push(j)
                  else 
                     @@major_map["Physics"]=[]
                     @@major_map["Physics"].push(j)
                  end
                
             end

             if j.include? "Agent"
                 if @@major_map.has_key?("Film, Televsion, and Interactive Media")
                     @@major_map["Film, Televsion, and Interactive Media"].push(j)
                  else 
                     @@major_map["Film, Televsion, and Interactive Media"]=[]
                     @@major_map["Film, Televsion, and Interactive Media"].push(j)
                  end
                  if @@major_map.has_key?("Theater Arts")
                     @@major_map["Theater Arts"].push(j)
                  else 
                     @@major_map["Theater Arts"]=[]
                     @@major_map["Theater Arts"].push(j)
                  end
                  if @@major_map.has_key?("Creativity, the Arts, and Social Transformation")
                     @@major_map["Creativity, the Arts, and Social Transformation"].push(j)
                  else 
                     @@major_map["Creativity, the Arts, and Social Transformation"]=[]
                     @@major_map["Creativity, the Arts, and Social Transformation"].push(j)
                  end
        
             end

             if j.include? "Air" && j!= "Airport Manager"
                 if @@major_map.has_key?("Physics")
                     @@major_map["Physics"].push(j)
                  else 
                     @@major_map["Physics"]=[]
                     @@major_map["Physics"].push(j)
                  end
                
             end

             if j.include? "Manager"  or j.include? "Business" or j.include? "Owner" or j.include? "Gamble" or j.include? "Operator" or j.include? "Merch"
                 if @@major_map.has_key?("Business")
                    @@major_map["Business"].push(j)
                  else 
                     @@major_map["Business"]=[]
                     @@major_map["Business"].push(j)
                  end
                
             end
             if j.include? "Almoner" 
                if @@major_map.has_key?("Business")
                   @@major_map["Business"].push(j)
                 else 
                    @@major_map["Business"]=[]
                    @@major_map["Business"].push(j)
                 end
                 if @@major_map.has_key?("Sociology")
                    @@major_map["Sociology"].push(j)
                  else 
                     @@major_map["Sociology"]=[]
                     @@major_map["Sociology"].push(j)
                  end
                 if @@major_map.has_key?("Health: Science, Soceity, and Policy")
                    @@major_map["Health: Science, Soceity, and Policy"].push(j)
                 else 
                    @@major_map["Health: Science, Soceity, and Policy"]=[]
                    @@major_map["Health: Science, Soceity, and Policy"].push(j)
                 end
            end

            if j.include? "Ambulance" 
                if @@major_map.has_key?("Molecular and Cell Biology")
                   @@major_map["Molecular and Cell Biology"].push(j)
                 else 
                    @@major_map["Molecular and Cell Biology"]=[]
                    @@major_map["Molecular and Cell Biology"].push(j)
                 end
                 if @@major_map.has_key?("Health: Science, Soceity, and Policy")
                    @@major_map["Health: Science, Soceity, and Policy"].push(j)
                 else 
                    @@major_map["Health: Science, Soceity, and Policy"]=[]
                    @@major_map["Health: Science, Soceity, and Policy"].push(j)
                 end
                 if @@major_map.has_key?("Neuroscince")
                    @@major_map["Neuroscince"].push(j)
                 else 
                    @@major_map["Neuroscince"]=[]
                    @@major_map["Neuroscince"].push(j)
                 end
                 if @@major_map.has_key?("Postbaccalaureate Premed Studies")
                    @@major_map["Postbaccalaureate Premed Studies"].push(j)
                 else 
                    @@major_map["Postbaccalaureate Premed Studies"]=[]
                    @@major_map["Postbaccalaureate Premed Studies"].push(j)
                 end
            end

            if j.include? "Amusement" or j.include? "Choreographer" or j.include? "Circus" or j.include? "Entertainer" or j.include? "Magician"
                if @@major_map.has_key?("Theater Arts")
                   @@major_map["Theater Arts"].push(j)
                 else 
                    @@major_map["Theater Arts"]=[]
                    @@major_map["Theater Arts"].push(j)
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
                if @@major_map.has_key?("Chemistry")
                   @@major_map["Chemistry"].push(j)
                 else 
                    @@major_map["Chemistry"]=[]
                    @@major_map["Chemistry"].push(j)
                 end
            end
            
            if j.include? "Anesthetics" 
                if @@major_map.has_key?("Molecular and Cell Biology")
                   @@major_map["Molecular and Cell Biology"].push(j)
                 else 
                    @@major_map["Molecular and Cell Biology"]=[]
                    @@major_map["Molecular and Cell Biology"].push(j)
                 end
                 if @@major_map.has_key?("Health: Science, Soceity, and Policy")
                    @@major_map["Health: Science, Soceity, and Policy"].push(j)
                 else 
                    @@major_map["Health: Science, Soceity, and Policy"]=[]
                    @@major_map["Health: Science, Soceity, and Policy"].push(j)
                 end
                 if @@major_map.has_key?("Neuroscince")
                    @@major_map["Neuroscince"].push(j)
                 else 
                    @@major_map["Neuroscince"]=[]
                    @@major_map["Neuroscince"].push(j)
                 end
                 if @@major_map.has_key?("Postbaccalaureate Premed Studies")
                    @@major_map["Postbaccalaureate Premed Studies"].push(j)
                 else 
                    @@major_map["Postbaccalaureate Premed Studies"]=[]
                    @@major_map["Postbaccalaureate Premed Studies"].push(j)
                 end
            end

            if j.include? "Breeder" or j.include? "Florist"
                if @@major_map.has_key?("Biology")
                    @@major_map["Biology"].push(j)
                  else 
                     @@major_map["Biology"]=[]
                     @@major_map["Biology"].push(j)
                  end
                if @@major_map.has_key?("Molecular and Cell Biology")
                   @@major_map["Molecular and Cell Biology"].push(j)
                 else 
                    @@major_map["Molecular and Cell Biology"]=[]
                    @@major_map["Molecular and Cell Biology"].push(j)
                 end
                 if @@major_map.has_key?("Genetic Counseling")
                    @@major_map["Genetic Counseling"].push(j)
                  else 
                     @@major_map["Genetic Counseling"]=[]
                     @@major_map["Genetic Counseling"].push(j)
                  end
            end

            if j.include? "Anthro" 
                if @@major_map.has_key?("Anthropology")
                   @@major_map["Anthropology"].push(j)
                 else 
                    @@major_map["Anthropology"]=[]
                    @@major_map["Anthropology"].push(j)
                 end
            end


            if j.include? "Dealer" or j.include? "Auction" or j.include? "Steward" or j.include? "Clerk" or j.include? "Buyer" or j.include? "Salesman" or j.include? "Retailer" or j.include? "Consultant"
                if @@major_map.has_key?("Business")
                   @@major_map["Business"].push(j)
                 else 
                    @@major_map["Business"]=[]
                    @@major_map["Business"].push(j)
                 end
            end

            if j.include? "Applications" or j.include? "IT"
                if @@major_map.has_key?("Computer Science")
                   @@major_map["Computer Science"].push(j)
                 else 
                    @@major_map["Computer Science"]=[]
                    @@major_map["Computer Science"].push(j)
                 end
            end

            if j.include? "Arbitrator" 
                if @@major_map.has_key?("Peace, Conflict, and Coexistance Studies")
                   @@major_map["Peace, Conflict, and Coexistance Studies"].push(j)
                 else 
                    @@major_map["Peace, Conflict, and Coexistance Studies"]=[]
                    @@major_map["Peace, Conflict, and Coexistance Studies"].push(j)
                 end
                 if @@major_map.has_key?("Legal Studies")
                    @@major_map["Legal Studies"].push(j)
                  else 
                     @@major_map["Legal Studies"]=[]
                     @@major_map["Legal Studies"].push(j)
                  end
            end

            if j.include? "Arborist" 
                if @@major_map.has_key?("Molecular and Cell Biology")
                   @@major_map["Molecular and Cell Biology"].push(j)
                 else 
                    @@major_map["Molecular and Cell Biology"]=[]
                    @@major_map["Molecular and Cell Biology"].push(j)
                 end
            end
  
            if j.include? "Archaeologist"  or j.include? "China Restorer"
                if @@major_map.has_key?("History")
                   @@major_map["History"].push(j)
                 else 
                    @@major_map["History"]=[]
                    @@major_map["History"].push(j)
                 end
                 if @@major_map.has_key?("History of Ideas")
                    @@major_map["History of Ideas"].push(j)
                  else 
                     @@major_map["History of Ideas"]=[]
                     @@major_map["History of Ideas"].push(j)
                  end
                 if @@major_map.has_key?("Greek")
                    @@major_map["Greek"].push(j)
                  else 
                     @@major_map["Greek"]=[]
                     @@major_map["Greek"].push(j)
                  end
                  if @@major_map.has_key?("Russian")
                    @@major_map["Russian"].push(j)
                  else 
                     @@major_map["Russian"]=[]
                     @@major_map["Russian"].push(j)
                  end
                  if @@major_map.has_key?("Latin")
                    @@major_map["Latin"].push(j)
                  else 
                     @@major_map["Latin"]=[]
                     @@major_map["Latin"].push(j)
                  end
                  if @@major_map.has_key?("Classical Studies")
                    @@major_map["Classical Studies"].push(j)
                  else 
                     @@major_map["Classical Studies"]=[]
                     @@major_map["Classical Studies"].push(j)
                  end
                  if @@major_map.has_key?("Romance")
                    @@major_map["Romance"].push(j)
                  else 
                     @@major_map["Romance"]=[]
                     @@major_map["Roance"].push(j)
                  end
            end
            j.include? "Installer" or j.include? "Build"  or j.include? "Contracter" or j.include? "Fixer" or j.include? "Fitter" and j!= "Body Fitter"
                if @@major_map.has_key?("Architectural Studies")
                    @@major_map["Architectural Studies"].push(j)
                else 
                    @@major_map["Architectural Studies"]=[]
                    @@major_map["Architectural Studies"].push(j)
                end
            end

            if j.include? "Architect"  
                if @@major_map.has_key?("Physics")
                   @@major_map["Physics"].push(j)
                 else 
                    @@major_map["Physics"]=[]
                    @@major_map["Physics"].push(j)
                 end
                 if @@major_map.has_key?("Studio Art")
                    @@major_map["Studio Art"].push(j)
                  else 
                     @@major_map["Studio Art"]=[]
                     @@major_map["Studio Art"].push(j)
                  end
                  if @@major_map.has_key?("Architectural Studies")
                    @@major_map["Architectural Studies"].push(j)
                  else 
                     @@major_map["Architectural Studies"]=[]
                     @@major_map["Architectural Studies"].push(j)
                  end
            end
            if j.include? "Archivist" 
                if @@major_map.has_key?("History")
                   @@major_map["History"].push(j)
                 else 
                    @@major_map["History"]=[]
                    @@major_map["History"].push(j)
                 end
                 if @@major_map.has_key?("History of Ideas")
                    @@major_map["History of Ideas"].push(j)
                  else 
                     @@major_map["History of Ideas"]=[]
                     @@major_map["History of Ideas"].push(j)
                  end
            end

            if j.include? "Armorer" 
                if @@major_map.has_key?("Biotechnology")
                   @@major_map["Biotechnology"].push(j)
                 else 
                    @@major_map["Biotechnology"]=[]
                    @@major_map["Biotechnology"].push(j)
                 end
                 if @@major_map.has_key?("Biotechnology")
                    @@major_map["Biotechnology"].push(j)
                  else 
                     @@major_map["Biotechnology"]=[]
                     @@major_map["Biotechnology"].push(j)
                  end
            end


            if j.include? "Therapist" or j.include? "therapist" or j.include? "Hypono" 
                if @@major_map.has_key?("Health: Science, Soceity, and Policy")
                   @@major_map["Health: Science, Soceity, and Policy"].push(j)
                 else 
                    @@major_map["Health: Science, Soceity, and Policy"]=[]
                    @@major_map["Health: Science, Soceity, and Policy"].push(j)
                 end
                 if @@major_map.has_key?("Physcology")
                    @@major_map["Biotechnology"].push(j)
                  else 
                     @@major_map["Biotechnology"]=[]
                     @@major_map["Biotechnology"].push(j)
                  end
            end


            if j.include? "Art" or j.include? "Baloonist" or j.include? "Maker" or j.include? "Cartoon" or j.include? "Comissioned" or j.include? "Decorator" or j.include? "Aranger" or j.include? "Art" 
                if @@major_map.has_key?("Studio Art")
                   @@major_map["Studio Art"].push(j)
                 else 
                    @@major_map["Studio Art"]=[]
                    @@major_map["Studio Art"].push(j)
                 end
                 if @@major_map.has_key?("Fine Art")
                    @@major_map["Fine Art"].push(j)
                  else 
                     @@major_map["Fine Art"]=[]
                     @@major_map["Fine Art"].push(j)
                  end
                  if @@major_map.has_key?("Sculpture")
                    @@major_map["Sculpture"].push(j)
                  else 
                     @@major_map["Sculpture"]=[]
                     @@major_map["Sculpture"].push(j)
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

             if j.include? "Care" or j.include? "Teacher" or j.include? "Child" or j.include? "Class" or j.include? "Counselor"
                if @@major_map.has_key?("Education")
                   @@major_map["Education"].push(j)
                 else 
                    @@major_map["Education"]=[]
                    @@major_map["Education"].push(j)
                 end
            end

            
            if j.include? "Nurse" or j.include? "Audiologist" or "Chiro" or j.include? "Doctor" or j.include? "Practitioner" or j.include? "Gynaecologist" or j.include? "Phram"
                if @@major_map.has_key?("Molecular and Cell Biology")
                    @@major_map["Molecular and Cell Biology"].push(j)
                  else 
                     @@major_map["Molecular and Cell Biology"]=[]
                     @@major_map["Molecular and Cell Biology"].push(j)
                  end
                  if @@major_map.has_key?("Health: Science, Soceity, and Policy")
                     @@major_map["Health: Science, Soceity, and Policy"].push(j)
                  else 
                     @@major_map["Health: Science, Soceity, and Policy"]=[]
                     @@major_map["Health: Science, Soceity, and Policy"].push(j)
                  end
                  if @@major_map.has_key?("Neuroscince")
                     @@major_map["Neuroscince"].push(j)
                  else 
                     @@major_map["Neuroscince"]=[]
                     @@major_map["Neuroscince"].push(j)
                  end
                  if @@major_map.has_key?("Postbaccalaureate Premed Studies")
                     @@major_map["Postbaccalaureate Premed Studies"].push(j)
                  else 
                     @@major_map["Postbaccalaureate Premed Studies"]=[]
                     @@major_map["Postbaccalaureate Premed Studies"].push(j)
                  end
            end
            
            if j.include? "Astro" or j.include? "Astro" or j.include? "Civil Engenieer" or j.include? "Heating Engenieer"
                if @@major_map.has_key?("Physics")
                    @@major_map["Physics"].push(j)
                 else 
                    @@major_map["Physics"]=[]
                    @@major_map["Physics"].push(j)
                 end
            end
          
            if j.include? "Athlet" or j.include? "Footballer" or j.include? "Remover" or j.include? "Restorer" or j.include? "Golf" or j.include? "Fit"
                if @@major_map.has_key?("Physical Education")
                    @@major_map["Physical Education"].push(j)
                 else 
                    @@major_map["Physical Education"]=[]
                    @@major_map["Physical Education"].push(j)
                 end
            end
          
            if j.include? "Attendant"  or j.include?"Au Pair" or j.include?"Lecturer"
                if @@major_map.has_key?("Education")
                   @@major_map["Education"].push(j)
                 else 
                    @@major_map["Education"]=[]
                    @@major_map["Education"].push(j)
                 end
            end


            if j.include? "Care" 
                if @@major_map.has_key?("Education")
                   @@major_map["Education"].push(j)
                 else 
                    @@major_map["Education"]=[]
                    @@major_map["Education"].push(j)
                 end
            end

            if j.include? "Curer" or  j.include?"Baker"
                if @@major_map.has_key?("Chemistry")
                   @@major_map["Chemistry"].push(j)
                 else 
                    @@major_map["Chemistry"]=[]
                    @@major_map["Chemistry"].push(j)
                 end
            end

            
            if j.include? "Bailiff" or j.include? "Barrister" or j.include? "Civil Servant" or j.include? "Councilor" or j.include? "Foreman" or j.include? "Inspector" or j.include? "Law"  or j.include? "Legal" or j.include? "Litigat" 
                if @@major_map.has_key?("Legal Studies")
                    @@major_map["Legal Studies"].push(j)
                  else 
                     @@major_map["Legal Studies"]=[]
                     @@major_map["Legal Studies"].push(j)
                  end
            end

            if j.include? "Minister" or j.include? "Chap" or j.include? "Church" or j.include? "Clergy" or j.include? "Cleric"
                if @@major_map.has_key?("Religous Studies")
                    @@major_map["Religous Studies"].push(j)
                  else 
                     @@major_map["Religous Studies"]=[]
                     @@major_map["Religous Studies"].push(j)
                  end
            end

            if j.include? "Bar" and j!="Barrister" or j.include? "Worker" or j.include? "Auction" or j.include? "Shop" or j.include? "Poster" or j.include? "Caller" or j.include? "Hairdresser" or j.include? "Handy" or  j.include? "Lumber"
                if @@major_map.has_key?("Independant Interdisciplanary Major")
                   @@major_map["Independant Interdisciplanary Major"].push(j)
                 else 
                    @@major_map["Independant Interdisciplanary Major"]=[]
                    @@major_map["Independant Interdisciplanary Major"].push(j)
                 end
            end

            if j.include? "Beaut"   or  j.include? "Litnographer" or j.include? "Marble" 
                if @@major_map.has_key?("Studio Art")
                   @@major_map["Studio Art"].push(j)
                 else 
                    @@major_map["Studio Art"]=[]
                    @@major_map["Studio Art"].push(j)
                 end
                 if @@major_map.has_key?("Fine Art")
                    @@major_map["Fine Art"].push(j)
                  else 
                     @@major_map["Fine Art"]=[]
                     @@major_map["Fine Art"].push(j)
                  end
            end

            if j.include? "Bio" 
                if @@major_map.has_key?("Biology")
                   @@major_map["Biology"].push(j)
                 else 
                    @@major_map["Biology"]=[]
                    @@major_map["Biology"].push(j)
                 end
                 if @@major_map.has_key?("Biological Physics")
                    @@major_map["Biological Physics"].push(j)
                  else 
                     @@major_map["Biological Physics"]=[]
                     @@major_map["Biological Physics"].push(j)
                  end
                  if @@major_map.has_key?("Biochemistry")
                    @@major_map["Biochemistry"].push(j)
                  else 
                     @@major_map["Biochemistry"]=[]
                     @@major_map["Biochemistry"].push(j)
                  end
            end

            if j.include? "Smith"  or j.include? "Assembler" or  j.include? "Brewer" or  j.include? "Brick"
                if @@major_map.has_key?("Independant Interdisciplanary Major")
                   @@major_map["Independant Interdisciplanary Major"].push(j)
                 else 
                    @@major_map["Independant Interdisciplanary Major"]=[]
                    @@major_map["Independant Interdisciplanary Major"].push(j)
                 end
            end

            if j.include? "Body"  or j.include? "Trainer" or j.include? "Jockey" or j.include? "Life" or j.include? "Lift"
                if @@major_map.has_key?("Physical Education")
                   @@major_map["Physical Education"].push(j)
                 else 
                    @@major_map["Physical Education"]=[]
                    @@major_map["Physical Education"].push(j)
                 end
            end

            if j.include? "Liter" or j.include? "Libra" or j.include? "Book"  and j.exclude? "Booking"
                if @@major_map.has_key?("University Writing (COMP and UWS)")
                   @@major_map["University Writing (COMP and UWS)"].push(j)
                 else 
                    @@major_map["University Writing (COMP and UWS)"]=[]
                    @@major_map["University Writing (COMP and UWS)"].push(j)
                 end
                 if @@major_map.has_key?("English")
                    @@major_map["English"].push(j)
                  else 
                     @@major_map["English"]=[]
                     @@major_map["English"].push(j)
                  end
                  if @@major_map.has_key?("Creative Writing")
                    @@major_map["Creative Writing"].push(j)
                  else 
                     @@major_map["Creative Writing"]=[]
                     @@major_map["Creative Writing"].push(j)
                  end
                  if @@major_map.has_key?("Comparative Literature and Culture")
                    @@major_map["Comparative Literature and Culture"].push(j)
                  else 
                     @@major_map["Comparative Literature and Culture"]=[]
                     @@major_map["Comparative Literature and Culture"].push(j)
                  end
            end

            if j.include? "Botanist" 
                if @@major_map.has_key?("Biology")
                   @@major_map["Biology"].push(j)
                 else 
                    @@major_map["Biology"]=[]
                    @@major_map["Biology"].push(j)
                 end
            end

            if j.include? "Broadcast" or j.include? "Interview" or j.include? "Journal"
                if @@major_map.has_key?("Journalism")
                   @@major_map["Journalism"].push(j)
                 else 
                    @@major_map["Journalism"]=[]
                    @@major_map["Journalism"].push(j)
                 end
            end

            if j.include? "Bar" or j.include? "Driver" or j.include? "Valet" or j.include? "Company" or j.include? "Conducter" or j.include? "Butcher" or j.include? "Butler" or j.include? "Kennel Hand"
                if @@major_map.has_key?("Independant Interdisciplanary Major")
                   @@major_map["Independant Interdisciplanary Major"].push(j)
                 else 
                    @@major_map["Independant Interdisciplanary Major"]=[]
                    @@major_map["Independant Interdisciplanary Major"].push(j)
                 end
            end

            if j.include? "Staff" or j.include? "Caterer" or j.include?  "Cashier" or j.include? "Car" and j.exclude? "Care" and j.exclude? "Cart"
                if @@major_map.has_key?("Independant Interdisciplanary Major")
                   @@major_map["Independant Interdisciplanary Major"].push(j)
                 else 
                    @@major_map["Independant Interdisciplanary Major"]=[]
                    @@major_map["Independant Interdisciplanary Major"].push(j)
                 end
            end

            if j.include? "Cartographer"  or j.include? "Hort" or j.include? "Meteor"
                if @@major_map.has_key?("Environmental Studies")
                   @@major_map["Environmental Studies"].push(j)
                 else 
                    @@major_map["Environmental Studies"]=[]
                    @@major_map["Environmental Studies"].push(j)
                 end
            end
          
            if j.include? "Caulker" or j.include? "Celler" or  j.include? "Chamber" or  j.include? "Chandler" or  j.include? "Chaufer" or  j.include? "Chef" or  j.include? "Chicken" or j.include? "Sweep" or j.include? "Clairvoyant" or j.include? "Cleaner" or or j.include? "Messeger"
                if @@major_map.has_key?("Independant Interdisciplanary Major")
                   @@major_map["Independant Interdisciplanary Major"].push(j)
                 else 
                    @@major_map["Independant Interdisciplanary Major"]=[]
                    @@major_map["Independant Interdisciplanary Major"].push(j)
                 end
            end

            if j.include? "Charge Hand" or j.include?"Charter" or j.include?"Inventor" or j.include?"License"
                if @@major_map.has_key?("Business")
                    @@major_map["Business"].push(j)
                  else 
                     @@major_map["Business"]=[]
                     @@major_map["Business"].push(j)
                  end
            end

            if j.include? "Coroner" or j.include? "Investigator" or j.include? "Judge"
                if @@major_map.has_key?("Legal Studies")
                    @@major_map["Legal Studies"].push(j)
                  else 
                     @@major_map["Legal Studies"]=[]
                     @@major_map["Legal Studies"].push(j)
                  end

                  if @@major_map.has_key?("Justice Brandeis Semester")
                    @@major_map["Justice Brandeis Semester"].push(j)
                  else 
                     @@major_map["Justice Brandeis Semester"]=[]
                     @@major_map["Justice Brandeis Semester"].push(j)
                  end
            end

            if j.include? "Editor"  
                if @@major_map.has_key?("University Writing (COMP and UWS)")
                   @@major_map["University Writing (COMP and UWS)"].push(j)
                 else 
                    @@major_map["University Writing (COMP and UWS)"]=[]
                    @@major_map["University Writing (COMP and UWS)"].push(j)
                 end
                 if @@major_map.has_key?("English")
                    @@major_map["English"].push(j)
                  else 
                     @@major_map["English"]=[]
                     @@major_map["English"].push(j)
                  end
                  if @@major_map.has_key?("Creative Writing")
                    @@major_map["Creative Writing"].push(j)
                  else 
                     @@major_map["Creative Writing"]=[]
                     @@major_map["Creative Writing"].push(j)
                  end
                  if @@major_map.has_key?("Comparative Literature and Culture")
                    @@major_map["Comparative Literature and Culture"].push(j)
                  else 
                     @@major_map["Comparative Literature and Culture"]=[]
                     @@major_map["Comparative Literature and Culture"].push(j)
                  end
                  if @@major_map.has_key?("Journalism")
                    @@major_map["Journalism"].push(j)
                  else 
                     @@major_map["Journalism"]=[]
                     @@major_map["Journalism"].push(j)
                  end
            end

            if j == "Engenieer"
                if @@major_map.has_key?("Physics")
                    @@major_map["Physics"].push(j)
                 else 
                    @@major_map["Physics"]=[]
                    @@major_map["Physics"].push(j)
                 end
                 if @@major_map.has_key?("Mathematics")
                    @@major_map["Mathematics"].push(j)
                 else 
                    @@major_map["Mathematics"]=[]
                    @@major_map["Mathematics"].push(j)
                 end
             end

             if j.include? "Envoy" 
                if @@major_map.has_key?("International and Global Studies")
                    @@major_map["International and Global Studies"].push(j)
                  else 
                     @@major_map["International and Global Studies"]=[]
                     @@major_map["International and Global Studies"].push(j)
                  end
            end

            if j.include? "Executive" or j.include? "Hotelier" or j.include? "Manufacturer"
                if @@major_map.has_key?("Business")
                   @@major_map["Business"].push(j)
                 else 
                    @@major_map["Business"]=[]
                    @@major_map["Business"].push(j)
                 end
            end

            if j.include? "Farmer" or j.include? "Fire" or  j.include? "Floor" or  j.include? "Flour" or  j.include? "Foam" or  j.include? "Food" or  j.include? "Forest" or j.include? "Fruit" or j.include? "Funeral" or j.include? "Funernace"
                if @@major_map.has_key?("Independant Interdisciplanary Major")
                   @@major_map["Independant Interdisciplanary Major"].push(j)
                 else 
                    @@major_map["Independant Interdisciplanary Major"]=[]
                    @@major_map["Independant Interdisciplanary Major"].push(j)
                 end
            end

            if j.include? "Parent" or j.include? "Instructor"
               helper("Education",j)
            end

            if j.include? "French" 
                helper("French and Francone Studies",j)
            end
   
            if j.include? "Fund" or j.include? "Loans" or j.include? "Loss"
                helper("Business",j)
                helper("Economics",j)
                helper( "International Business School",j)
            end

            if j.include? "Furrier" or j.include? "Game" or j.include? "Gardener" or j.include? "Gas" or j.include? "Keeper" or j.include? "Handler" or j.include? "Technition" or j.include? "Grave" or j.include? "Grocer" or j.include? "Groom"
                helper("Independant Interdisciplanary Major",j)
            end

            if j.include? "Designer" or  j.include? "Guilder" or  j.include? "Glass" or  j.include? "Glazier" or  j.include? "Printer" or j.include? "Illustrator" or j.include? "Decoratator" or j.include? "Joiner"
                helper("Fine Art",j)
                helper("Studio",j)
            end
            
            if j.include? "Gene" 
               helper("Biology",j)
               helper("Molecular and Cell Biology",j)
               helper("Anthropology",j)
               helper("Global Studies",j)
            end

            if j.include? "Geologist" 
                helper("Biology",j)
                helper("Molecular and Cell Biology",j)
                helper("Environmental Studies ",j)
             end
            
             if j.include? "Gov" 
                helper("Politics",j)
                helper("Global Studies",j)
                helper("International and Global Studies",j)
             end

             if j.include? "Graphologist" 
                helper("Physcology",j)
                helper("Creative Writng",j)
             end

             if j.include? "Green" or j.include? "Ground" or j.include? "Map" or j.include? "Marine"
                helper("Environmental Studies ",j)
             end

             if j.include? "Proprietor" or j.include? "Hawker" or j.include? "Land" or j.include? "Market" or j.include? "Controller" or j.include? "sale"
                helper("Business",j)
             end
             if j.include? "Health" or j.include? "Hearing" or j.include? "Hospitol" or j.include? "Hygenist" or j.include? "Medical"
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

            if j.include? "Instrument" or j.include? "Jazz" or j.include? "Jewler"
                helper("Music",j)
            end

            if j.include? "Insurance" 
                helper("Business",j)
                helper("Health: Science, Soceity, and Policy",j)
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
            if j.include? "Knit" 
                helper("Fine Art",j)
                helper("Studio",j)
            end
            if j.include? "Mach" or j.include? "Maid" or j.include? "Manicurist" or j.include? "Marquee" or j.include? "Matron" or j.include? "Metal"
                helper("Independant Interdisciplanary Major",j)
            end

            if j.include? "Magistrate" 
                if @@major_map.has_key?("Legal Studies")
                    @@major_map["Legal Studies"].push(j)
                  else 
                     @@major_map["Legal Studies"]=[]
                     @@major_map["Legal Studies"].push(j)
                  end
            end

            if j.include? "Marble"
                helper("Fine Art",j)
                helper("Studio",j)
            end

            if j.include? "Mass" 
                helper("Health: Science, Soceity, and Policy",j)
            end

            if j.include? "Math" 
                helper("Mathematics",j)
             end

          end
     #end 

   

def get_hash()
    return @major_map
 end 

end
