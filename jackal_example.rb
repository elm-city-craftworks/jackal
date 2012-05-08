require_relative "lib/jackal"

abort "Need source directory" unless ARGV[0]
abort "Need destination directory" unless ARGV[1]

files = Dir.glob("#{ARGV[0]}/**/*.markdown")

files.each do |file|
  Jackal::Post.new(Jackal::Page.new(file)).save(ARGV[1])
end
