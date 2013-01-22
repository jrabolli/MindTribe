require 'spec_helper'

describe "problems/index.html.erb" do
  before(:each) do
    assign(:problems, [
      stub_model(Problem,
        :problem => "Problem",
        :code => "Code",
        :notes => "MyText",
        :user_id => 1
      ),
      stub_model(Problem,
        :problem => "Problem",
        :code => "Code",
        :notes => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of problems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Problem".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
