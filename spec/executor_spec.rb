# frozen_string_literal: true
require 'rspec'
require_relative '../lib/nmax/executor'

RSpec.describe Executor do
  context 'at performance' do
    txt_file = File.readlines("#{__dir__}/fixtures/sample_text_file.txt")
    e = Executor.new(txt_file, 100)
    template = [
      40,
      456,
      654,
      789,
      987,
      1000,
      10**4,
      *1..10,
      999 * (10**996),
      1000 * (10**996)
    ].sort

    it 'finds integers' do
      expect(e.perform.sort).to eq template
    end
  end

  context 'when creating an instance of a class without argument' do
    e = Executor.new('something', nil)

    it 'get default argument' do
      expect(e.instance_variable_get('@argument')).to eq Executor::DEFAULT_ARGUMENT
    end
  end
end
