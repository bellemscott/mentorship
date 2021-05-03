require "test_helper"

class MenteeTest < ActiveSupport::TestCase
  
  def setup
    @mentee = Mentee.new(user_id: "1", major: "Computer Science", area_of_interest: "Software Development", preferred_method_of_contact: "Text", 
       location: "MA", length_of_mentorship: "1", graduation_year: "2022")
    @mentee_no_grad_year = Mentee.new(major: "Business", area_of_interest: "Accounting",preferred_method_of_contact: "Text", 
         location: "New York", length_of_mentorship: "7", graduation_year: " ", user_id: "14")
     @mentee_length_of_ment = Mentee.new(major: "Computer Science", area_of_interest: "Software Development",preferred_method_of_contact: "Text", 
           location: "Boston", length_of_mentorship: "", graduation_year: "2022", user_id: "15")
     @mentee_no_major = Mentee.new(major: "", area_of_interest: "Software Development",preferred_method_of_contact: "Text", 
            location: "Boston", length_of_mentorship: "", graduation_year: "2022", user_id: "16")
    @mentee_no_location = Mentee.new(major: "", area_of_interest: "Software Development",preferred_method_of_contact: "Text", 
          location: "", length_of_mentorship: "", graduation_year: "2022", user_id: "19")
    @mentee_no_contact = Mentee.new(major: "", area_of_interest: "Software Development",preferred_method_of_contact: "", 
            location: "", length_of_mentorship: "", graduation_year: "2022", user_id: "20")
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

<<<<<<< HEAD
  test "no location" do
    assert @mentee_no_location.valid?
  end

  test "no method of contact" do
    assert @mentee_no_contact.valid?
=======
  test "no major" do
    assert_not @mentee_no_major.valid?
>>>>>>> edbc7a9e822ac277d07617930ab5e748f48f37af
  end

end
