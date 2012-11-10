require 'spec_helper'

describe "clippings/new.html.erb" do
  before(:each) do
    assign(:clipping, stub_model(Clipping,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new clipping form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clippings_path, :method => "post" do
      assert_select "input#clipping_user_id", :name => "clipping[user_id]"
    end
  end
end
