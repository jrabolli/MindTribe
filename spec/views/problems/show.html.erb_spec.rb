require 'spec_helper'

describe "problems/show.html.erb" do
  before(:each) do
    @problem = assign(:problem, stub_model(Problem,
      :problem => "Problem",
      :code => "Code",
      :notes => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Problem/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
