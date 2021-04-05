require "test_helper"

class MentorTest < ActiveSupport::TestCase

  def setup
    @mentor = Mentor.new(area_of_expertise: "Software Engineering", preferred_method_of_contact: "Text", school: "Brandeis", 
      current_position: "Manager", location: "Boston", length_of_mentorship: "1", user_id: "1")
    @mentor_nullfield = Mentor.new(area_of_expertise: "", preferred_method_of_contact: "Text", school: "Brandeis", 
        current_position: "Manager", location: "Boston", length_of_mentorship: "1", user_id: "1")
    @mentor_emptyform = Mentor.new(area_of_expertise: "", preferred_method_of_contact: "", school: "", 
          current_position: "", location: "", length_of_mentorship: "", user_id: "")
  end

  test "should be valid" do
    assert @mentor.valid?
    assert @mentor_nullfield.valid?
    assert @mentor_emptyform.valid?
  end

end
