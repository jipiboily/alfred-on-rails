require 'spec_helper'

describe "todos/edit.html.slim" do
  before(:each) do
    @todo = assign(:todo, stub_model(Todo,
      :body => "MyString",
      :isDone => false
    ))
  end

  it "renders the edit todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todos_path(@todo), :method => "post" do
      assert_select "input#todo_body", :name => "todo[body]"
      assert_select "input#todo_isDone", :name => "todo[isDone]"
    end
  end
end
