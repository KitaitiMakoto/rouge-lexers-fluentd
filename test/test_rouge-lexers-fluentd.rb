require 'helper'
require 'rouge/lexers/fluentd'

class TestRougeLexersFluentd < Test::Unit::TestCase

  def test_version
    version = Rouge::Lexers::Fluentd.const_get('VERSION')

    assert !version.empty?, 'should have a VERSION constant'
  end

end
