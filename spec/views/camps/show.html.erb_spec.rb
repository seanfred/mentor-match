require 'spec_helper'

describe "camps/show" do
  before(:each) do
    @camp = assign(:camp, stub_model(Camp,
      :student_id => 1,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Description/)
  end
end
