# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

if Rails.env.prof?
 use Rack::RubyProf, :path => '/tmp/prof'
  RubyProf.start
  result = RubyProf.stop
  printer = RubyProf::GraphPrinter.new(result)
  printer.print(STDOUT, :min_percent => 2)
end
