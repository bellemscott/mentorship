require "application_system_test_case"

class MentorsTest < ApplicationSystemTestCase
  setup do
    @mentor = mentors(:one)
  end

  test "visiting the index" do
    visit mentors_url
    assert_selector "h1", text: "Mentors"
  end

  test "creating a Mentor" do
    visit mentors_url
    click_on "New Mentor"

    fill_in "Area of expertise", with: @mentor.area_of_expertise
    fill_in "Current position", with: @mentor.current_position
    fill_in "Length of mentorship", with: @mentor.length_of_mentorship
    fill_in "Location", with: @mentor.location
    fill_in "Prefferd method of contact", with: @mentor.prefferd_method_of_contact
    fill_in "School", with: @mentor.school
    click_on "Create Mentor"

    assert_text "Mentor was successfully created"
    click_on "Back"
  end

  test "updating a Mentor" do
    visit mentors_url
    click_on "Edit", match: :first

    fill_in "Area of expertise", with: @mentor.area_of_expertise
    fill_in "Current position", with: @mentor.current_position
    fill_in "Length of mentorship", with: @mentor.length_of_mentorship
    fill_in "Location", with: @mentor.location
    fill_in "Prefferd method of contact", with: @mentor.prefferd_method_of_contact
    fill_in "School", with: @mentor.school
    click_on "Update Mentor"

    assert_text "Mentor was successfully updated"
    click_on "Back"
  end

  test "destroying a Mentor" do
    visit mentors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mentor was successfully destroyed"
  end
end
