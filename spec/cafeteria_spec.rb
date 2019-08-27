require 'spec_helper'
require_relative '../cafeteria.rb'

describe 'sum' do
  it 'adds two numbers' do
    num1 = 2
    num2 = 3
    expected = 5
    actual = sum(num1, num2)
    expect(actual).to eq(expected)
  end
end