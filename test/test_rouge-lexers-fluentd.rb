require 'helper'
require 'rouge/lexers/fluentd'

class TestRougeLexersFluentd < Test::Unit::TestCase
  def setup
    @lexer = Rouge::Lexers::Fluentd.new(debug: ENV['ROUGE_DEBUG'])
    @demo = File.read(File.join(__dir__, '../lib/rouge/demos/fluentd'))
    @demo_stack = YAML.load(File.read(File.join(__dir__, 'demo-stack.yaml')))
  end

  data("fluent.conf", "fluent.conf")
  data("td-agent.conf", "td-agent.conf")
  def test_guess(filename)
    actual = Rouge::Lexer.guess(filename: filename)
    assert_equal Rouge::Lexers::Fluentd, actual
  end

  def test_lex
    tokens = @lexer.lex(@demo)
    stack = tokens.collect {|token, value|
      [token.qualname, value]
    }
    assert_equal @demo_stack, stack
  end
end
