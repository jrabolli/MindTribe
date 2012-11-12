require 'spec_helper'

describe "folders/new.html.erb" do
  before(:each) do
    assign(:folder, stub_model(Folder,
      :name => "MyString",
      :parent_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new folder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => folders_path, :method => "post" do
      assert_select "input#folder_name", :name => "folder[name]"
      assert_select "input#folder_parent_id", :name => "folder[parent_id]"
      assert_select "input#folder_user_id", :name => "folder[user_id]"
    end
  end
end
