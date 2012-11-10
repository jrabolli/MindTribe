require 'spec_helper'

describe "clippings/index.html.erb" do
  before(:each) do
    assign(:clippings, [
      stub_model(Clipping,
        :user_id => 1
      ),
      stub_model(Clipping,
        :user_id => 1
      )
    ])
  end

  it "renders a list of clippings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
