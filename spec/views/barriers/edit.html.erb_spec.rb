require 'spec_helper'

describe "barriers/edit.html.erb" do
  before(:each) do
    @barrier = assign(:barrier, stub_model(Barrier,
      :barrier => "MyText",
      :intervention => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit barrier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => barriers_path(@barrier), :method => "post" do
      assert_select "textarea#barrier_barrier", :name => "barrier[barrier]"
      assert_select "textarea#barrier_intervention", :name => "barrier[intervention]"
      assert_select "input#barrier_user_id", :name => "barrier[user_id]"
    end
  end
end
