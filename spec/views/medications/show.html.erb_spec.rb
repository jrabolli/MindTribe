require 'spec_helper'

describe "medications/show.html.erb" do
  before(:each) do
    @medication = assign(:medication, stub_model(Medication,
      :name => "Name",
      :problem => "Problem",
      :dosage => "Dosage",
      :instructions => "Instructions",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Problem/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dosage/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Instructions/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
