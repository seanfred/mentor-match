require 'spec_helper'

describe "camps/edit" do
  before(:each) do
    @camp = assign(:camp, stub_model(Camp,
      :student_id => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit camp form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", camp_path(@camp), "post" do
      assert_select "input#camp_student_id[name=?]", "camp[student_id]"
      assert_select "input#camp_description[name=?]", "camp[description]"
    end
  end
end
