require "test_helper"

class MenteesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mentee = mentees(:one)
  end

  test "should get index" do
    get mentees_url
    assert_response :success
  end

  test "should get new" do
    get new_mentee_url
    assert_response :success
  end

  test "should create mentee" do
    assert_difference('Mentee.count') do
      post mentees_url, params: { mentee: { area_of_interest: @mentee.area_of_interest, graduation_year: @mentee.graduation_year, length_of_mentorship: @mentee.length_of_mentorship, location: @mentee.location, major: @mentee.major, preffered_method_of_contact: @mentee.preffered_method_of_contact } }
    end

    assert_redirected_to mentee_url(Mentee.last)
  end

  test "should show mentee" do
    get mentee_url(@mentee)
    assert_response :success
  end

  test "should get edit" do
    get edit_mentee_url(@mentee)
    assert_response :success
  end

  test "should update mentee" do
    patch mentee_url(@mentee), params: { mentee: { area_of_interest: @mentee.area_of_interest, graduation_year: @mentee.graduation_year, length_of_mentorship: @mentee.length_of_mentorship, location: @mentee.location, major: @mentee.major, preffered_method_of_contact: @mentee.preffered_method_of_contact } }
    assert_redirected_to mentee_url(@mentee)
  end

  test "should destroy mentee" do
    assert_difference('Mentee.count', -1) do
      delete mentee_url(@mentee)
    end

    assert_redirected_to mentees_url
  end
end