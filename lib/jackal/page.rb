require "yaml"

module Jackal
  class Page
    def initialize(source_file)
      @filename = File.basename(source_file)

      read_page(source_file)
    end

    attr_reader :content, :filename, :metadata, :contents

    private

    def read_page(filename)
      @contents = File.read(filename)

      begin
        if (md = @contents.match(/^(?<headers>---\s*\n.*?\n?)^(---\s*$\n?)/m))
          @contents = md.post_match
          @metadata = YAML.load(md[:headers])
        end
      rescue => e
        puts "YAML Exception reading #{filename}: #{e.message}"
      end
    end
  end
end
