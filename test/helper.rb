require 'rubygems'

begin
  require 'bundler/setup'
rescue LoadError => error
  abort error.message
end

require 'test/unit'

class Test::Unit::TestCase
end
