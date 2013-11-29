require 'spec_helper'

describe "mentorships/show" do
  before(:each) do
    @mentorship = assign(:mentorship, stub_model(Mentorship,
      :student_id => 1,
      :mentor_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
