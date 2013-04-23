require "spec_helper"

describe ApplicationHelper do
  describe "#title" do
    it "should return the title from @title" do
      @title = "Foo"
      title.should eq "Foo"
    end

    it "should return the tagline when no @title is set" do
      @title = nil
      title.should eq "Share and Discover those Special Campings"
    end
  end
end
