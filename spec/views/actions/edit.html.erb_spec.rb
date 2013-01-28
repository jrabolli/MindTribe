require 'spec_helper'

describe "actions/edit.html.erb" do
  before(:each) do
    @action = assign(:action, stub_model(Action,
      :action => "MyText",
      :person_responsible => "MyString",
      :user_id => 1,
      :goal_id => 1,
      :result => "MyText"
    ))
  end

  it "renders the edit action form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => actions_path(@action), :method => "post" do
      assert_select "textarea#action_action", :name => "action[action]"
      assert_select "input#action_person_responsible", :name => "action[person_responsible]"
      assert_select "input#action_user_id", :name => "action[user_id]"
      assert_select "input#action_goal_id", :name => "action[goal_id]"
      assert_select "textarea#action_result", :name => "action[result]"
    end
  end
end
