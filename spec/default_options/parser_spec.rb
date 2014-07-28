require 'helper'

class DummyClass
  def self.dummy_method(opts = {})
    options = DefaultOptions::Parser.new opts do
      thing1 "foo"
      thing2 "bar"
    end

    return options
  end
end

describe DefaultOptions::Parser do
  context "when no overrides are given" do
    it "initializes the default options" do
      result = DummyClass.dummy_method
      expect(result.thing1).to eq('foo')
      expect(result.thing2).to eq('bar')
    end
  end

  context "when simple overrides are given" do
    it "merges the defaults with the overrides" do
      result = DummyClass.dummy_method(:thing1 => 'baz')
      expect(result.thing1).to eq('baz')
      expect(result.thing2).to eq('bar')
    end
  end

  context "when non-defaulted overrides are given" do
    it "merges the defaults with the overrides" do
      result = DummyClass.dummy_method(:thing3 => 'baz')
      expect(result.thing1).to eq('foo')
      expect(result.thing2).to eq('bar')
      expect(result.thing3).to eq('baz')
    end
  end
end


