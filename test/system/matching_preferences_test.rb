require "application_system_test_case"

class MatchingPreferencesTest < ApplicationSystemTestCase
  setup do
    @matching_preference = matching_preferences(:one)
  end

  test "visiting the index" do
    visit matching_preferences_url
    assert_selector "h1", text: "Matching Preferences"
  end

  test "creating a Matching preference" do
    visit matching_preferences_url
    click_on "New Matching Preference"

    check "Brandeis alumni" if @matching_preference.brandeis_alumni
    check "Common subjects" if @matching_preference.common_subjects
    check "Length of mentorship" if @matching_preference.length_of_mentorship
    check "Location" if @matching_preference.location
    click_on "Create Matching preference"

    assert_text "Matching preference was successfully created"
    click_on "Back"
  end

  test "updating a Matching preference" do
    visit matching_preferences_url
    click_on "Edit", match: :first

    check "Brandeis alumni" if @matching_preference.brandeis_alumni
    check "Common subjects" if @matching_preference.common_subjects
    check "Length of mentorship" if @matching_preference.length_of_mentorship
    check "Location" if @matching_preference.location
    click_on "Update Matching preference"

    assert_text "Matching preference was successfully updated"
    click_on "Back"
  end

  test "destroying a Matching preference" do
    visit matching_preferences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Matching preference was successfully destroyed"
  end
end
