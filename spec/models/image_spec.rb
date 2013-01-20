require "spec_helper"

describe Image do
  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it { should validate_attachment_content_type(:image).
    allowing('image/png', 'image/jpg', 'image/jpeg').
    rejecting('text/plain', 'text/xml', 'image/gif') }
  it { should validate_attachment_size(:image).
    less_than(5.megabytes) }

  context "thumbnail" do
    it "is a derivative" do
      Image.attachment_definitions[:image].should include(:styles)
      Image.attachment_definitions[:image][:styles].should include(:thumb)
    end
    it "has correct image style geometry" do
      Image.attachment_definitions[:image][:styles][:thumb].should == "150x150>"
    end
  end
end
