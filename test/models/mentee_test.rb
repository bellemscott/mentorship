require "test_helper"

class MenteeTest < ActiveSupport::TestCase
  
  def setup
    @mentee = Mentee.new(major: "Computer Science", area_of_interest: "Software Development",preferred_method_of_contact: "Text", 
       location: "Boston", length_of_mentorship: "1", graduation_year: "2022", user_id: "8")
    @mentee_no_grad_year = Mentee.new(major: "Business", area_of_interest: "Accounting",preferred_method_of_contact: "Text", 
         location: "New York", length_of_mentorship: "7", graduation_year: " ", user_id: "14")
     @mentee_length_of_ment = Mentee.new(major: "Computer Science", area_of_interest: "Software Development",preferred_method_of_contact: "Text", 
           location: "Boston", length_of_mentorship: "", graduation_year: "2022", user_id: "15")
     @mentee_no_major = Mentee.new(major: "", area_of_interest: "Software Development",preferred_method_of_contact: "Text", 
            location: "Boston", length_of_mentorship: "", graduation_year: "2022", user_id: "16")
  end

  test "general Mentee" do
    assert @mentee.valid?
  end

  test "No grad year" do
    assert @mentee_no_grad_year.valid?
  end

  test "no length of mentorship" do
    assert_not @mentee_length_of_ment.valid?
  end

  test "no major" do
    assert_not @mentor_noMentorshipLength.valid?
  end

end
