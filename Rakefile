begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "clock"
    gem.summary = "A wrapper for Ruby's Time object that includes a mock for manipulating time in tests"
    gem.description = "Works exactly like Ruby's standard Time object, but in test mode adds some nice methods for setting or manually advancing time."
    gem.email = "pivotal-opensource@googlegroups.com"
    gem.homepage = "http://github.com/pivotal/clock"
    gem.authors = ["Pivotal Labs"]
    gem.files = Dir["{lib}/**/*"]
    gem.add_dependency "rails", '~> 3.0.0'
  end
rescue
  puts "Jeweler or one of its dependencies is not installed."
end