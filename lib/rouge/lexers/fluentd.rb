require "rouge"

module Rouge
  module Lexers
    class Fluentd < RegexLexer
      title "Fluentd"
      desc "configuration files for Fluentd"
      tag "fluentd"
      filenames "fluent.conf", "td-agent.conf"
    end
  end
end
