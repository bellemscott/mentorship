require 'test_helper'

class MatchesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    get '/users/sign_in'
    @ex_user_mentee = User.create(firstname: "billy", lastname: "joe", email: "billyjoe@gmail.com", password: "123456", mentor: "false", mentee:"true")
    sign_in @ex_user_mentee
    @ex_user_mentor = User.create(firstname: "annie", lastname: "joe", email: "anniejoe@gmail.com", password: "123456", mentor: "true", mentee:"false")
    
    @mentee_ex1 = Mentee.create(major: "Computer Science", area_of_interest: "Software Development",preferred_method_of_contact: "Text", 
       location: "Boston", length_of_mentorship: "1", graduation_year: "2022", user_id: @ex_user_mentee.id)
    @mentor_ex1 = Mentor.create(area_of_expertise: "Software Engineering", preferred_method_of_contact: "Text", school: "Brandeis", 
        current_position: "Manager", location: "Boston", length_of_mentorship: "2", user_id: @ex_user_mentor.id)


    @mentee1 = Mentee.create(major: "Mathematics", area_of_interest: "Software Development",preferred_method_of_contact: "Text", 
          location: "Boston", length_of_mentorship: "7", graduation_year: "2022", user_id: "31")
    @mentor2 = Mentor.create(area_of_expertise: "Software Engineering", preferred_method_of_contact: "Text", school: "Brandeis", 
           current_position: "Historian", location: "Boston", length_of_mentorship: "7", user_id: "30")
    @testing_map=@common_subjects_map
  end

  # test "match on length" do
  #   mentee.create()
  #   @mentee1.create()
  #   assert_equals(Match.first)
  # end
  test "match on common subjects" do
    post '/matches/create'
    assert 2, Match.count 
    match = Match.find_by(user_id:@ex_user_mentee.id)
    assert match != nil
    other_match= Match.find_by(user_id:@ex_user_mentor.id)
    assert other_match != nil
  end

  test "map test" do
    assert(@common_subjects_map["Business"].include? "Accountant")
    assert(@common_subjects_map["Computer Science"].include? "Software Engineer")
    assert(@common_subjects_map["Mathematics"].include? "Statistician")
    assert(@common_subjects_map["Mathematics"].include? "Actuary")
    assert(@common_subjects_map["History"].include? "Historian")
    assert(@common_subjects_map["History"].include? "Art Historian")
    assert(@common_subjects_map["Theater Arts"].include? "Actor")
    assert(@common_subjects_map["Theater Arts"].include? "Actress")
  end

  test "matching_on_common_subjects" do

  end
    
end
