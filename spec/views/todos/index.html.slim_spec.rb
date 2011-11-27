require 'spec_helper'

describe "todos/index.html.slim" do
  before(:each) do
    assign(:todos, [
      stub_model(Todo,
        :body => "Body",
        :isDone => false
      ),
      stub_model(Todo,
        :body => "Body",
        :isDone => false
      )
    ])
  end

  it "renders a list of todos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
