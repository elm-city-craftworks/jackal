require_relative "../helper"
require_relative "../../lib/jackal/post"

require "ostruct"

describe Jackal::Post do
  let(:post) do
    page = OpenStruct.new
    page.source_file = "2012-05-07-first-post.markdown"
    page.metadata    = { :category => "essays" }

    Jackal::Post.new(page)
  end

  it "must generate dirname" do
    post.dirname.must_equal("essays/2012/05/07")
  end

  it "must generate filename" do
    post.filename.must_equal("first-post.html")
  end

  it "must generate path" do
    post.path.must_equal("essays/2012/05/07/first-post.html")
  end
end
