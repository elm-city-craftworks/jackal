require_relative "../helper"
require_relative "../../lib/jackal/page"

describe Jackal::Page do
  let(:page) do
    Jackal::Page.new("2012-05-07-first-post.markdown")
  end

  it "must generate dirname" do
    page.dirname.must_equal("2012/05/07")
  end

  it "must generate filename" do
    page.filename.must_equal("first-post.html")
  end

  it "must generate path" do
    page.path.must_equal("2012/05/07/first-post.html")
  end
end
