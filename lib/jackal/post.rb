require "pathname"

require "redcarpet"

require_relative "page"

module Jackal
  class Post
    FILE_PATTERN = /\A(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})-
                    (?<basename>.*).markdown\z/x

    MARKDOWN_CONVERTER = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

    def initialize(page, converter=MARKDOWN_CONVERTER)
      self.filedata = page.filename.match(FILE_PATTERN)
      self.metadata = page.metadata
      self.contents = converter.render(page.contents)
    end

    attr_reader :contents

    def dirname
      raise ArgumentError unless metadata["category"]

      [ metadata["category"], 
        filedata["year"], filedata["month"], filedata["day"] ].join("/")
    end

    def filename
      "#{filedata[:basename]}.html"
    end

    def path
      "#{dirname}/#{filename}"
    end

    def save(base_dir)
      target_dir = Pathname.new(base_dir) + dirname
      
      target_dir.mkpath

      File.write(target_dir + filename, contents)
    end

    private

    attr_accessor :filedata, :metadata
    attr_writer   :contents
  end
end
