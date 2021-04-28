require "test_helper"

class MatchesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @mentee = Mentee.new(major: "Computer Science", area_of_interest: "Software Development",preferred_method_of_contact: "Text", 
       location: "Boston", length_of_mentorship: "1", graduation_year: "2022", user_id: "31")
    @mentor = Mentor.new(area_of_expertise: "Software Engineering", preferred_method_of_contact: "Text", school: "Brandeis", 
        current_position: "Manager", location: "Boston", length_of_mentorship: "1", user_id: "30")
    @mentee1 = Mentee.new(major: "Mathematics", area_of_interest: "Software Development",preferred_method_of_contact: "Text", 
          location: "Boston", length_of_mentorship: "7", graduation_year: "2022", user_id: "31")
    @mentor2 = Mentor.new(area_of_expertise: "Software Engineering", preferred_method_of_contact: "Text", school: "Brandeis", 
           current_position: "Historian", location: "Boston", length_of_mentorship: "7", user_id: "30")
    @testing_map=@common_subjects_map
  end

  # test "match on length" do
  #   mentee.create()
  #   @mentee1.create()
  #   assert_equals(Match.first.)
  # end

  test "map test" do
    assert(true,@common_subjects_map["Business"].include? "Accountant")
    assert(true,@common_subjects_map["Computer Science"].include? "Software Engenierr")
    assert(true,@common_subjects_map["Mathematics"].include? "Statistician")
    assert(true,@common_subjects_map["Mathematics"].include? "Actuary")
    assert(true,@common_subjects_map["History"].include? "Historian")
    assert(true,@common_subjects_map["History"].include? "Art Historian")
    assert(true,@common_subjects_map["Theater Arts"].include? "Actor")
    assert(true,@common_subjects_map["Theater Arts"].include? "Actress")
  end


end
