require 'spec_helper'

describe "barriers/new.html.erb" do
  before(:each) do
    assign(:barrier, stub_model(Barrier,
      :barrier => "MyText",
      :intervention => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new barrier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => barriers_path, :method => "post" do
      assert_select "textarea#barrier_barrier", :name => "barrier[barrier]"
      assert_select "textarea#barrier_intervention", :name => "barrier[intervention]"
      assert_select "input#barrier_user_id", :name => "barrier[user_id]"
    end
  end
end
