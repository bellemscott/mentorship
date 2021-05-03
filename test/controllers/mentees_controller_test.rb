require "test_helper"

class MenteesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mentee = Mentee.create(major: "Computer Science", area_of_interest: "Software Development",preferred_method_of_contact: "Text", 
      location: "Boston", length_of_mentorship: "1", graduation_year: "2022", user_id: "1")
  end

  test "should get index" do
    get mentees_url
    assert_response :success
  end

  test "should get new" do
    get new_mentee_url
    assert_response :success
  end


  test "should get edit" do
    get edit_mentee_url(@mentee)
    assert_response :success
  end

  test "should update mentee" do
    patch mentee_url(@mentee), params: { mentee: { area_of_interest: @mentee.area_of_interest, graduation_year: @mentee.graduation_year, length_of_mentorship: @mentee.length_of_mentorship, location: @mentee.location, major: @mentee.major, preferred_method_of_contact: @mentee.preferred_method_of_contact } }
    assert_redirected_to mentee_url(@mentee)
  end

  test "should destroy mentee" do
    assert_difference('Mentee.count', -1) do
      delete mentee_url(@mentee)
    end

    assert_redirected_to mentees_url
  end
end
