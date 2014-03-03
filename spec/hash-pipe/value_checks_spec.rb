require 'spec_helper'

describe 'value checks' do
  let(:hash) { {foo: "bar", baz: "box", zap: nil} }

  describe 'no_blank_values' do
    it 'should return the hash without any nil values' do
      hash.no_blank_values.should_not have_key(:zap)
    end
  end

  describe "except" do
    it 'should return the hash except keys listed' do
      hash.except(:baz).should_not have_key(:baz)
    end
  end

  describe "only" do
    it 'should return a hash containing only the keys listed' do
      hash.only(:baz).should have_key(:baz)
      hash.only(:baz).should_not have_key(:foo)
    end
  end
end