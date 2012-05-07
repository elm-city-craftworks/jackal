require_relative "page"

module Jackal
  class Post
    FILE_PATTERN = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})-
                    (?<basename>.*).markdown/x

    def initialize(page)
      @file_info = page.source_file.match(FILE_PATTERN)
      @metadata  = page.metadata
    end

    def dirname
      [ metadata[:category], 
        file_info[:year], file_info[:month], file_info[:day] ].join("/")
    end

    def filename
      "#{file_info[:basename]}.html"
    end

    def path
      "#{dirname}/#{filename}"
    end

    private

    attr_reader :file_info, :metadata
  end
end
