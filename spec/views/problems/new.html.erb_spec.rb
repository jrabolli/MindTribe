require 'spec_helper'

describe "problems/new.html.erb" do
  before(:each) do
    assign(:problem, stub_model(Problem,
      :problem => "MyString",
      :code => "MyString",
      :notes => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new problem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => problems_path, :method => "post" do
      assert_select "input#problem_problem", :name => "problem[problem]"
      assert_select "input#problem_code", :name => "problem[code]"
      assert_select "textarea#problem_notes", :name => "problem[notes]"
      assert_select "input#problem_user_id", :name => "problem[user_id]"
    end
  end
end
