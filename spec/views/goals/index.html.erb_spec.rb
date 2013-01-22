require 'spec_helper'

describe "goals/index.html.erb" do
  before(:each) do
    assign(:goals, [
      stub_model(Goal,
        :goal => "Goal",
        :action => "MyText",
        :person_responsible => "Person Responsible",
        :expected_outcome => "MyText",
        :results => "MyText",
        :user_id => 1
      ),
      stub_model(Goal,
        :goal => "Goal",
        :action => "MyText",
        :person_responsible => "Person Responsible",
        :expected_outcome => "MyText",
        :results => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of goals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Goal".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Person Responsible".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
