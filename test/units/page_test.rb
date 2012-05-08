require_relative "../helper"
require_relative "../../lib/jackal/page"


describe Jackal::Page do
  let(:page) do
    posts_dir = "#{File.dirname(__FILE__)}/../fixtures/sample_app/_posts"
    Jackal::Page.new("#{posts_dir}/2012-05-07-first-post.markdown")
  end

  it "must extract the base filename" do
    page.filename.must_equal("2012-05-07-first-post.markdown")
  end
end
