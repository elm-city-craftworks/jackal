module Jackal
  class Page
    def initialize(source_file)
      @source_file = source_file
    end

    attr_reader :source_file
  end
end
