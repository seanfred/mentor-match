require 'spec_helper'

describe "mentorships/index" do
  before(:each) do
    assign(:mentorships, [
      stub_model(Mentorship,
        :student_id => 1,
        :mentor_id => 2
      ),
      stub_model(Mentorship,
        :student_id => 1,
        :mentor_id => 2
      )
    ])
  end

  it "renders a list of mentorships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
