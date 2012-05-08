require "yaml"

module Jackal
  class Page
    def initialize(source_file)
      self.filename = File.basename(source_file)

      read_page(source_file)
    end

    attr_reader :filename, :metadata, :contents

    private

    attr_writer :filename, :metadata, :contents

    def read_page(filename)
      self.contents = File.read(filename)

      begin
        if (md = contents.match(/^(?<headers>---\s*\n.*?\n?)^(---\s*$\n?)/m))
          self.contents = md.post_match
          self.metadata = YAML.load(md[:headers])
        end
      rescue => e
        puts "YAML Exception reading #{filename}: #{e.message}"
      end
    end
  end
end
