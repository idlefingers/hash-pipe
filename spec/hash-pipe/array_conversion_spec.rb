require 'spec_helper'

describe 'next' do
  it 'should nest an array' do
    ['hello', 'world'].to_nested_hash.should eq 'hello' => 'world'
  end

  it 'should handle just one element in array' do
    ["hello"].to_nested_hash.should eq "hello"
  end

  it 'should handle an empty array' do
    [].to_nested_hash.should eq nil
  end

  it 'should throw error on nil values' do
    expect{[nil, 'hello', 'world'].to_nested_hash}.to raise_error ArgumentError
  end

  it 'should nest longer arrays' do
    ['errors', 'something', 'somethingElse', 'password',  ['VALIDATION_STATE_PASSWORD']].to_nested_hash.should eq 'errors' => {
      'something' => {
        'somethingElse' => {
          'password' => ['VALIDATION_STATE_PASSWORD']
        }
      }
    }
  end
end

