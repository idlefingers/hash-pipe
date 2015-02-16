require 'spec_helper'

describe 'key_conversion' do

  it 'should convert keys to lowercase by default' do
    { 'HELLO' => 'world' }.convert_keys.should eq 'hello' => 'world'
  end

  it 'should convert the key to a string if it is a symbol' do
    { hello: "world" }.convert_keys.should eq 'hello' => 'world'
  end

  it 'should accept any method you can call on a string to convert the key' do
    { hello: "world" }.convert_keys(:upcase).should eq 'HELLO' => 'world'
  end

  it 'should convert nested hashes with the same logic' do
    { 'HELLO' => { 'MR' => 'world' } }.convert_keys.should eq 'hello' => {'mr' => 'world'}
  end

  it 'should be both an instance and class method' do
    Hash.new.should respond_to(:convert_keys)
    Hash.should respond_to(:convert_keys)
  end

  it 'should convert an array of hashes with the same logic' do
    Hash.convert_keys([{ 'HELLO' => 'world' }, { 'FOO' => 'bar' }]).should eq [{ 'hello' => 'world' }, { 'foo' => 'bar' }]
  end

  it 'should convert arrays of hashes' do
    { 'HELLO' => [{ 'MR' => 'world' }] }.convert_keys.should eq 'hello' => [{'mr' => 'world'}]
  end

  it 'should not convert values other than arrays and hashes' do
    Hash.convert_keys("HELLO WORLD").should eq "HELLO WORLD"
  end

  it 'should support lambdas for conversion methods' do
    converter = -> (str) { str.sub "hello", "goodbye" }
    { 'hello' => 'world' }.convert_keys(converter).should eq 'goodbye' => 'world'
  end

end