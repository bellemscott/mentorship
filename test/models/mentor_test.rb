 require "/test/models/test_helper.rb"

class MentorTest < ActiveSupport::TestCase

  def setup
    @mentor = Mentor.new(area_of_expertise: "Software Engineering", preferred_method_of_contact: "Text", school: "Brandeis", 
      current_position: "Manager", location: "Boston", length_of_mentorship: "1", user_id: "1")
    @mentor_nullfield = Mentor.new(area_of_expertise: "", preferred_method_of_contact: "Text", school: "Brandeis", 
        current_position: "Manager", location: "Boston", length_of_mentorship: "1", user_id: "41")
   @mentor_noCurrPos = Mentor.new(area_of_expertise: "Medicine", preferred_method_of_contact: "Text", school: "Brandeis", 
          current_position: "", location: "New York", length_of_mentorship: "13", user_id: "7")
   @mentor_noMentorshipLength = Mentor.new(area_of_expertise: "Accounting", preferred_method_of_contact: "Text", school: "Brandeis", 
            current_position: "Accountant", location: "New York", length_of_mentorship: "", user_id: "14")
    @mentor_emptyform = Mentor.new(area_of_expertise: "", preferred_method_of_contact: "", school: "", 
          current_position: "", location: "", length_of_mentorship: "", user_id: "")
    @mentor_no_location = Mentor.new(area_of_expertise: "Software Engineering", preferred_method_of_contact: "Text", school: "Brandeis", 
            current_position: "Manager", location: "", length_of_mentorship: "1", user_id: "42")
    @mentor_no_school = Mentor.new(area_of_expertise: "Software Engineering", preferred_method_of_contact: "Text", school: "", 
          current_position: "Manager", location: "Boston", length_of_mentorship: "1", user_id: "43")
  end

  test "should be valid" do
    assert @mentor.valid?
    assert @mentor_nullfield.valid?
    assert_not @mentor_emptyform.valid? #dont think this test shoud pass with new changes
  end

  test "no current position" do
    assert_not @mentor_noCurrPos.valid?
  end

  test "no location" do
    assert @mentor_no_location.valid?
  end

  test "no school" do
    assert @mentor_no_school.valid?
  end

  test "empty form" do
    assert_not @mentor_emptyform.valid?
  end

  test "no length of mentorship" do
    assert_not @mentor_noMentorshipLength.valid?
  end


end
