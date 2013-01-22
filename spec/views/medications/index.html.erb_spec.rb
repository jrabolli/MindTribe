require 'spec_helper'

describe "medications/index.html.erb" do
  before(:each) do
    assign(:medications, [
      stub_model(Medication,
        :name => "Name",
        :problem => "Problem",
        :dosage => "Dosage",
        :instructions => "Instructions",
        :user_id => 1
      ),
      stub_model(Medication,
        :name => "Name",
        :problem => "Problem",
        :dosage => "Dosage",
        :instructions => "Instructions",
        :user_id => 1
      )
    ])
  end

  it "renders a list of medications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Problem".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dosage".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Instructions".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
