require 'spec_helper'

describe "clippings/show.html.erb" do
  before(:each) do
    @clipping = assign(:clipping, stub_model(Clipping,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
