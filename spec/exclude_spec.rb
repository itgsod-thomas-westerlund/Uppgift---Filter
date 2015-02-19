require 'rspec'

require_relative '../lib/filters.rb'

describe 'exclude' do

  it 'should take a list and an filter as argument' do
      expect{ exclude() }.to raise_error ArgumentError
      expect{ exclude(['Im not using keyword arguments'],'bosse') }.to raise_error ArgumentError
      expect{ exclude(array: ['I AM using a keyword argument'], value: 'bosse') }.not_to raise_error
  end

  it 'should return an array' do
    expect( exclude(array: [1,2,3], value: 3) ).to be_a Array
  end

  it 'should not modify the original array' do
    input = [1,2,3,3,4]
    exclude(array: input, value: 3)
    expect( input ).to eq [1,2,3,3,4]
  end

  it 'should should remove all occurences of "value" from the returned array' do
    expect( exclude(array: ['bosse', 'daniel', 'edvard', 'bosse', 'bosse'], value: 'bosse' )  ).to eq ['daniel', 'edvard']
    expect( exclude(array: ['bosse', 'daniel', 'edvard', 'bosse', 'bosse'], value: 'edvard') ).to eq ['bosse', 'daniel', 'bosse', 'bosse']
  end

end
