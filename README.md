# rouge-lexers-fluentd

* [Homepage](https://rubygems.org/gems/rouge-lexers-fluentd)
* [Documentation](http://rubydoc.info/gems/rouge-lexers-fluentd/frames)
* [Email](mailto:KitaitiMakoto at gmail.com)

## Description

Rouge lexer for fluentd configuration files

## Features

* Guesses Fluentd configuration files from filename
* Lexes Fluentd configuration files

## Examples

    require 'rouge/lexers/fluentd'
    
    config = File.read("path/to/fluent.conf")
    lexer = Rouge::Lexer.find("fluentd")
    tokens = lexer.lex(config)
    terminal_formatter = Rouge::Formatters::Terminal256.new
    html_formatter = Rouge::Formatters::HTML.new
    File.write 'path/to/output.html', html_formatter.format(tokens)
    puts terminal_formatter.format(tokens)

## Requirements

* [Rouge][]

## Install

    $ gem install rouge-lexers-fluentd

## Todo

* Lex array values
* Lex hash values
* Lex embedded Ruby code
* Recognize labels
* Recognize tag with separator dots
* Lex quotes in quoted strings correctly
* Lex closing brackets in array correctly
* Lex closing braces in hash correctly

## Copyright

Copyright (c) 2016 KITAITI Makoto

See {file:LICENSE.txt} for details.

[Rouge]: http://rouge.jneen.net/
