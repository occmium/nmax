# frozen_string_literal: true
require 'rspec'
require_relative '../lib/nmax/cleaner'

RSpec.describe Cleaner do
  before do
    sample_array = %w[9 1 5 9 1 5 8 2 7 3 6 4 0]
    @template_array = [*0..9]
    @quantity = 7
    @all_numbers = Cleaner.clean(sample_array, @quantity)
  end

  context '.clean' do
    it 'returns a unique integer numbers in ascending order' do
      expect(@all_numbers).to eq @template_array.last(@quantity)
    end
  end

  context '.clean' do
    it 'returns the required quantity' do
      expect(@all_numbers.size).to eq @quantity
    end
  end
end
