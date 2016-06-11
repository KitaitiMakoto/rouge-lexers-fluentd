require "rouge"

module Rouge
  module Lexers
    class Fluentd < RegexLexer
      title "Fluentd"
      desc "configuration files for Fluentd"
      tag "fluentd"
      filenames "fluent.conf", "td-agent.conf"

      state :whitespace do
        rule /\#.*/, Comment
        rule /\s+/m, Text
      end

      state :root do
        mixin :whitespace

        rule /(<\/?)(\w+)/ do
          groups Punctuation, Name::Label
          push :section
        end

        rule /@\w+/ do
          token Name::Builtin
          push :directive
        end

        rule /\w+/ do
          token Name::Class
          push :directive
        end
      end

      # @todo recognize tag with dots as separator
      # @todo recognize label
      state :section do
        rule /([^>]+)?(>(?:\r\n?|\n)?)/ do
          groups Literal::String::Regex, Punctuation
          pop!
        end

        mixin :whitespace
      end

      # @todo embedded Ruby code
      state :directive do
        rule /\r\n?|\n/, Text, :pop!

        mixin :whitespace

        rule /"/ do
          token Str::Double
          push :double_quoted_string
        end

        rule /'/ do
          token Str::Single
          push :single_quoted_string
        end

        rule /\[/ do
          token Punctuation
          push :array
        end

        rule /\{/ do
          token Punctuation
          push :hash
        end

        rule /\S+/ do
          token Literal::String::Symbol
        end
      end

      # @todo don't break at escaped double quote
      state :double_quoted_string do
        rule /([^\"]*)(\")/ do
          groups Literal::String::Symbol, Str::Double
          pop!
        end
      end

      # @todo don't break at escaped single quote
      state :single_quoted_string do
        rule /([^\']*)(\')/ do
          groups Literal::String::Symbol, Str::Single
          pop!
        end
      end

      # @todo don't escape at escaped or in-string closing bracket
      state :array do
        mixin :whitespace

        rule /\]/, Punctuation, :pop!
        rule /\S+/ do
          token Literal::String::Symbol
        end
      end

      # @todo don't escape at escaped or in-string closing brace
      state :hash do
        mixin :whitespace

        rule /}/, Punctuation, :pop!
        rule /\S+/ do
          token Literal::String::Symbol
        end
      end
    end
  end
end
