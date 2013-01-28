require 'spec_helper'

describe "actions/index.html.erb" do
  before(:each) do
    assign(:actions, [
      stub_model(Action,
        :action => "MyText",
        :person_responsible => "Person Responsible",
        :user_id => 1,
        :goal_id => 1,
        :result => "MyText"
      ),
      stub_model(Action,
        :action => "MyText",
        :person_responsible => "Person Responsible",
        :user_id => 1,
        :goal_id => 1,
        :result => "MyText"
      )
    ])
  end

  it "renders a list of actions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Person Responsible".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
