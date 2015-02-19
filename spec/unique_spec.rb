require 'rspec'

require_relative '../lib/filters.rb'

describe 'unique' do

  it 'should take an array as argument' do
    expect{ unique() }.to raise_error ArgumentError
    expect{ unique(['Im not using keyword arguments']) }.to raise_error ArgumentError
    expect{ unique(array: ['I AM using a keyword argument']) }.not_to raise_error
  end

  it 'should return an array' do
    expect( unique(array: [1,2,3]) ).to be_a Array
  end

  it 'should not modify the original array' do
    input = [1,2,3,3,4]
    unique(array: input)
    expect( input ).to eq [1,2,3,3,4]
  end

  it 'should return a new array with all duplicates removed' do
    expect( unique(array: ['bosse', 'daniel', 'edvard', 'bosse', 'bosse']) ).to eq ['bosse', 'daniel', 'edvard']
  end

end
