require 'rspec'

require_relative '../lib/filters.rb'

describe 'filter' do

  it 'should take a list and a value as argument' do
      expect{ filter() }.to raise_error ArgumentError
      expect{ filter(["Im not using keyword arguments"],"bosse") }.to raise_error ArgumentError
      expect{ filter(array: ['I AM using a keyword argument'], value: 'bosse') }.not_to raise_error
  end

  it 'should return an array' do
    expect( filter(array: [1,2,3], value: 3) ).to be_a Array
  end

  it 'should not modify the original array' do
    input = [1,2,3,3,4]
    filter(array: input, value: 3)
    expect( input ).to eq [1,2,3,3,4]
  end

  it 'should should return an array only containing all occurences of "value" ' do
    expect( filter(array: ['bosse', 'daniel', 'edvard', 'bosse', 'bosse'], value: 'bosse')  ).to eq ['bosse', 'bosse', 'bosse']
    expect( filter(array: ['bosse', 'daniel', 'edvard', 'bosse', 'bosse'], value: 'edvard') ).to eq ['edvard']
  end


end
