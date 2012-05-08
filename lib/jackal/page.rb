module Jackal
  class Page
    def initialize(source_file)
      @source_file = source_file
    end

    def filename
      File.basename(source_file)
    end

    private

    attr_reader :source_file
  end
end
