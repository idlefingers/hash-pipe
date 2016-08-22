require 'spec_helper'

describe 'next' do
  it 'should nest an array' do
    ['hello', 'world'].nest.should eq 'hello' => 'world'
  end

  it 'should handle just one element in array' do
    ["hello"].nest.should eq "hello"
  end

  it 'should handle an empty array' do
    [].nest.should eq nil
  end

  it 'should throw error on nil values' do
    expect{[nil, 'hello', 'world'].nest}.to raise_error ArgumentError
  end

  it 'should nest longer arrays' do
    ['errors', 'something', 'somethingElse', 'password',  ['VALIDATION_STATE_PASSWORD']].nest.should eq 'errors' => {
      'something' => {
        'somethingElse' => {
          'password' => ['VALIDATION_STATE_PASSWORD']
        }
      }
    }
  end
end

