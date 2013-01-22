require 'spec_helper'

describe "problems/edit.html.erb" do
  before(:each) do
    @problem = assign(:problem, stub_model(Problem,
      :problem => "MyString",
      :code => "MyString",
      :notes => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit problem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => problems_path(@problem), :method => "post" do
      assert_select "input#problem_problem", :name => "problem[problem]"
      assert_select "input#problem_code", :name => "problem[code]"
      assert_select "textarea#problem_notes", :name => "problem[notes]"
      assert_select "input#problem_user_id", :name => "problem[user_id]"
    end
  end
end
