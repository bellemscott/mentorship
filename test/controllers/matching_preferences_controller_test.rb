require "test_helper"

class MatchingPreferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matching_preference = matching_preferences(:one)
  end

  test "should get index" do
    get matching_preferences_url
    assert_response :success
  end

  test "should get new" do
    get new_matching_preference_url
    assert_response :success
  end

  test "should create matching_preference" do
    assert_difference('MatchingPreference.count') do
      post matching_preferences_url, params: { matching_preference: { brandeis_alumni: @matching_preference.brandeis_alumni, common_subjects: @matching_preference.common_subjects, length_of_mentorship: @matching_preference.length_of_mentorship, location: @matching_preference.location } }
    end

    assert_redirected_to matching_preference_url(MatchingPreference.last)
  end

  test "should show matching_preference" do
    get matching_preference_url(@matching_preference)
    assert_response :success
  end

  test "should get edit" do
    get edit_matching_preference_url(@matching_preference)
    assert_response :success
  end

  test "should update matching_preference" do
    patch matching_preference_url(@matching_preference), params: { matching_preference: { brandeis_alumni: @matching_preference.brandeis_alumni, common_subjects: @matching_preference.common_subjects, length_of_mentorship: @matching_preference.length_of_mentorship, location: @matching_preference.location } }
    assert_redirected_to matching_preference_url(@matching_preference)
  end

  test "should destroy matching_preference" do
    assert_difference('MatchingPreference.count', -1) do
      delete matching_preference_url(@matching_preference)
    end

    assert_redirected_to matching_preferences_url
  end
end
