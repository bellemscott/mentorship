require "test_helper"

class MentorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mentor = Mentor.create(area_of_expertise: "Software Engineering", preferred_method_of_contact: "Text", school: "Brandeis", 
      current_position: "Manager", location: "Boston", length_of_mentorship: "2", user_id: "2")
  end

  test "should get index" do
    get mentors_url
    assert_response :success
  end

  test "should get new" do
    get new_mentor_url
    assert_response :success
  end

  test "should get edit" do
    get edit_mentor_url(@mentor)
    assert_response :success
  end

  test "should update mentor" do
    patch mentor_url(@mentor), params: { mentor: { area_of_expertise: @mentor.area_of_expertise, current_position: @mentor.current_position, length_of_mentorship: @mentor.length_of_mentorship, location: @mentor.location, preferred_method_of_contact: @mentor.preferred_method_of_contact, school: @mentor.school } }
    assert_redirected_to mentor_url(@mentor)
  end

  test "should destroy mentor" do
    assert_difference('Mentor.count', -1) do
      delete mentor_url(@mentor)
    end

    assert_redirected_to mentors_url
  end
end
