module ApplicationHelper
  def title
    @title || "Share and Discover those Special Campings"
  end

  def m(text)
    RDiscount.new(text.to_s, :filter_html).to_html
  end
end
