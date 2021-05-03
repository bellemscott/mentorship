Matches
``` xml 
if current_user.mentor == true && current_user.mentee == false
    is_mentor()
elsif current_user.mentee  && current_user.mentor == false
    is_mentee()
```
First we check to see if the current user is a mentee or a mentor. If the current user is a mentee we iterate through the list of mentors to find a match. If the current user is a mentor we iterate through the current list of mentees inorder to find a match. 

``` xml 
 if (mentor.length_of_mentorship==@mentee.length_of_mentorship) or (@common_subjects_map[@mentee.major].include? mentor.current_position)
          newMatch= Match.new(:user_id => current_user.id, :mentor_id => mentor.id, :mentee_id => @mentee.id, :accepted => false)
          check_duplicate(newMatch)
end
```
We match based on two variables. If a mentee and a mentor indicate that they want to participate in the mentorship for the same amount of weeks, then a match will be created. The second variables we match on is the mentee's major and the mentor's occupation. When mentors sign up they can select their current position from a drop down menu that consicts of about 1,000 occupations. Mentees can select their major that from a drop down menu that consists of all of the majors offered at Brandeis. 

``` xml 
@common_subjects_map=JobMap.new.map_method
```
We created a hash that maps different majors to different occupations. This is a many to many relationship. A major is mapped to many occupations, and an occupations is mapped to many majors. If a mentor's current position is in the array of occupations that a metee's major is mapped to then a match is created. This was one of the most difficult part about creating our match algorithm. 
