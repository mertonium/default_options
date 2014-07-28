require "default_options/version"
require "default_options/parser"

module DefaultOptions
  module Macros
    def defaults_for(opts, &block)
      DefaultOptions::Parser.new opts, &block
    end
  end

  def self.included(base)
    base.extend(Macros)
  end

  def defaults_for(opts, &block)
    DefaultOptions::Parser.new opts, &block
  end
end
