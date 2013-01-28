require 'spec_helper'

describe "actions/show.html.erb" do
  before(:each) do
    @action = assign(:action, stub_model(Action,
      :action => "MyText",
      :person_responsible => "Person Responsible",
      :user_id => 1,
      :goal_id => 1,
      :result => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Person Responsible/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
