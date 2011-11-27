require 'spec_helper'

describe "todos/show.html.slim" do
  before(:each) do
    @todo = assign(:todo, stub_model(Todo,
      :body => "Body",
      :isDone => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Body/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
