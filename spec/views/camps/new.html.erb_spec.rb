require 'spec_helper'

describe "camps/new" do
  before(:each) do
    assign(:camp, stub_model(Camp,
      :student_id => 1,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new camp form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", camps_path, "post" do
      assert_select "input#camp_student_id[name=?]", "camp[student_id]"
      assert_select "input#camp_description[name=?]", "camp[description]"
    end
  end
end
