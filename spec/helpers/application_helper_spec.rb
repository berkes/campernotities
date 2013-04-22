require "spec_helper"

describe ApplicationHelper do
  describe "#title" do
    it "should return the title from @title" do
      @title = "Foo"
      title.should eq "Foo"
    end
  end
end
