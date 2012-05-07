require_relative "page"

module Jackal
  class Post
    FILE_PATTERN = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})-
                    (?<basename>.*).markdown/x

    def initialize(page)
      @data = page.source_file.match(FILE_PATTERN)
    end

    def dirname
      "#{data[:year]}/#{data[:month]}/#{data[:day]}"
    end

    def filename
      "#{data[:basename]}.html"
    end

    def path
      "#{dirname}/#{filename}"
    end

    private

    attr_reader :data
  end
end
