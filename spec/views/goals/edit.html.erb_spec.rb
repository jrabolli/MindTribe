require 'spec_helper'

describe "goals/edit.html.erb" do
  before(:each) do
    @goal = assign(:goal, stub_model(Goal,
      :goal => "MyString",
      :action => "MyText",
      :person_responsible => "MyString",
      :expected_outcome => "MyText",
      :results => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit goal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => goals_path(@goal), :method => "post" do
      assert_select "input#goal_goal", :name => "goal[goal]"
      assert_select "textarea#goal_action", :name => "goal[action]"
      assert_select "input#goal_person_responsible", :name => "goal[person_responsible]"
      assert_select "textarea#goal_expected_outcome", :name => "goal[expected_outcome]"
      assert_select "textarea#goal_results", :name => "goal[results]"
      assert_select "input#goal_user_id", :name => "goal[user_id]"
    end
  end
end
