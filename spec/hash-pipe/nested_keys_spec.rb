require 'spec_helper'

describe 'nested_keys' do

  it 'should work for flat hashes' do
    hash = { 'bank_code' => 123 }

    hash.nested_fetch('bank_code').should eq 123
  end

  it 'should be able to find nested values' do
    hash = { 'bank' => { 'code' => 123, 'number' => 12345 } }
    hash.nested_fetch(['bank', 'code']).should eq 123
  end

  it 'should be able to find nested values of mixed symbols and string keys' do
    hash = { 'bank' => { code: { 'SE' => 1 }, name: 'SEB' } }
    
    hash.nested_fetch(['bank', :code, 'SE']).should eq 1
    hash.nested_fetch(['bank', :name]).should eq 'SEB'
  end

  it 'should be able to delete nested values' do
    hash = { 'bank' => { code: { 'SE' => 1 }, name: 'SEB' }, 'email' => 'email@example.com' }
    hash.nested_delete ['bank', :name]

    hash['bank'][:name].should be_nil
  end

  it 'should be able to delete root values' do
    hash = { 'email' => 'email@example.com' }
    hash.nested_delete 'email'
    hash['email'].should be_nil
  end

  it 'should not change path array input data on fetch' do
    hash = { 'bank' => { 'code' => 2 } }
    path = ['bank', 'code']

    hash.nested_fetch path

    path.should eq ['bank', 'code']
  end

  it 'should not change path array input data on delete' do
    hash = { 'bank' => { 'code' => 2 } }
    path = ['bank', 'code']

    hash.nested_delete path

    path.should eq ['bank', 'code']
  end

end