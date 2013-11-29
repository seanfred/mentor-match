require 'spec_helper'

describe "mentorships/edit" do
  before(:each) do
    @mentorship = assign(:mentorship, stub_model(Mentorship,
      :student_id => 1,
      :mentor_id => 1
    ))
  end

  it "renders the edit mentorship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mentorship_path(@mentorship), "post" do
      assert_select "input#mentorship_student_id[name=?]", "mentorship[student_id]"
      assert_select "input#mentorship_mentor_id[name=?]", "mentorship[mentor_id]"
    end
  end
end
