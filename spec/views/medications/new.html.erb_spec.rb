require 'spec_helper'

describe "medications/new.html.erb" do
  before(:each) do
    assign(:medication, stub_model(Medication,
      :name => "MyString",
      :problem => "MyString",
      :dosage => "MyString",
      :instructions => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new medication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => medications_path, :method => "post" do
      assert_select "input#medication_name", :name => "medication[name]"
      assert_select "input#medication_problem", :name => "medication[problem]"
      assert_select "input#medication_dosage", :name => "medication[dosage]"
      assert_select "input#medication_instructions", :name => "medication[instructions]"
      assert_select "input#medication_user_id", :name => "medication[user_id]"
    end
  end
end
