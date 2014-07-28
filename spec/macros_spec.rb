require 'helper'

class DummyClass2
  include DefaultOptions
  def self.dummy_class_method(opts = {})
    options = defaults_for opts do
      thing1 "foo"
      thing2 "bar"
    end

    return options
  end

  def dummy_instance_method(opts = {})
    options = defaults_for opts do
      thing1 "foo"
      thing2 "bar"
    end

    return options
  end
end

describe DefaultOptions, :new_baktun => true do
  describe ".default_for" do
    context "when no overrides are given" do
      it "initializes the default options" do
        result = DummyClass2.dummy_class_method
        expect(result.thing1).to eq('foo')
        expect(result.thing2).to eq('bar')
      end
    end
  end

  describe "#default_for" do
    context "when no overrides are given" do
      it "initializes the default options" do
        result = DummyClass2.new.dummy_instance_method
        expect(result.thing1).to eq('foo')
        expect(result.thing2).to eq('bar')
      end
    end
  end
end

