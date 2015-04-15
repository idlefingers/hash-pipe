require 'spec_helper'

describe 'flattening' do
  it 'should do nothing on a flat hash' do
    { 'hello' => 'world' }.flatten_keys.should eq 'hello' => 'world'
  end

  it 'should do add a prefix' do
    { 'hello' => 'world' }.flatten_keys(prefix: "foo_").should eq 'foo_hello' => 'world'
  end

  it 'should allow nil values' do
    { 'hello' => 'world', 'bar' => nil }.flatten_keys(prefix: "foo_").should eq 'foo_hello' => 'world', 'foo_bar' => nil
  end

  it 'should work with nested hashes with no parameters' do
    { 'hello' => { 'world' => true }, 'foo' => 'bar' }.flatten_keys.should eq 'helloworld' => true, 'foo' => 'bar'
  end

  it 'should work with many levels of nested' do
    { 'hello' => { 'world' => { 'you' => { 'are' => 'awesome' } } } }.flatten_keys(delimiter: "_").should eq 'hello_world_you_are' => 'awesome'
  end

  it 'should work with delimters and post and prefixes' do
    {
      'hello' => {
        'world' => {
          'you' => {
            'are' => 'awesome'
          }
        }
      }
    }.flatten_keys(
      delimiter: "][",
      prefix: "response[",
      postfix: "]"
    ).should eq 'response[hello][world][you][are]' => 'awesome'
  end

  it 'should wrap keys in prefix and postfix' do
    {
      'hello' => {
        'world' => {
          'you' => {
            'are' => 'awesome'
          }
        }
      },
      'my' => 'lord',
      'foo' => 1,
      'bam' => 'yam'
    }.flatten_keys(
      prefix: "|_",
      postfix: "_|"
    ).should eq '|_helloworldyouare_|' => 'awesome',
                '|_my_|' => 'lord',
                '|_foo_|' => 1,
                '|_bam_|' => 'yam'
  end

  it 'should work with nested arrays' do
    { 'hello' => { 'world' => [[1, 2, 3], [1, 2, 3]] } }.flatten_keys(delimiter: "_").should eq 'hello_world' => [[1, 2, 3], [1, 2, 3]]
  end

  it 'should work with symbol keys' do
    { hello: "world", foo: { :bar => "baz", "flam" => "boil"} }.flatten_keys(delimiter: ",").should eq "hello" => "world", "foo,bar" => "baz", "foo,flam" => "boil"
  end
end
