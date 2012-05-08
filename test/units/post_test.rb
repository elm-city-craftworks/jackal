require_relative "../helper"
require_relative "../../lib/jackal/post"

require "ostruct"
require "tempfile"

describe Jackal::Post do
  let(:post) do
    page = OpenStruct.new
    page.filename = "2012-05-07-first-post.markdown"
    page.metadata = { "category" => "essays" }
    page.contents = "Hello *world*"

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

  it "must render contents to HTML" do
    post.contents.must_equal("<p>Hello <em>world</em></p>\n")
  end

  it "must be able to save contents to file" do
    Dir.mktmpdir do |base_dir|
      post.save(base_dir)

      Dir.chdir("#{base_dir}/#{post.dirname}") do
        File.read(post.filename).must_equal(post.contents)
      end
    end
  end
end
