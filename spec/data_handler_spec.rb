# frozen_string_literal: true
require 'rspec'
require_relative '../lib/nmax/data_handler'

RSpec.describe DataHandler do
  before do
    string = "The012sample 456 789.012.987,654 string and something!"
    @instance = DataHandler.new(string)
  end

  context 'when creating an instance of a class' do
    it 'constants and variables are initialized correctly' do
      expect(@instance.instance_variable_get('@string')).to eq "The012sample 456 789.012.987,654 string and something!"
      expect(@instance.instance_variable_get('@number').empty?).to eq true
      expect(@instance.instance_variable_get('@numbers').empty?).to eq true
      expect(DataHandler::TARGET_CHARACTERS).to eq ('0'..'9')
      expect(DataHandler::MAX_OF_DIGITS).to eq 1000
      expect(DataHandler::FLOAT_POINT_SYMBOL).to eq '.'
      expect(DataHandler::FLOAT_MARKS).to eq '.,'
    end
  end

  context '.reset_number' do
    it 'succeeds' do
      @instance.instance_variable_set('@number', 159.654)

      expect(@instance.instance_variable_get('@number')).to eq 159.654
      @instance.reset_number
      expect(@instance.instance_variable_get('@number').empty?).to eq true
    end
  end

  context '.check_for_float_marks(point)' do
    it 'succeeds' do
      @instance.instance_variable_set('@number', '12')

      @instance.check_for_float_marks('.')
      expect(@instance.instance_variable_get('@number')).to eq '12.'

      @instance.check_for_float_marks('.')
      expect(@instance.instance_variable_get('@number').empty?).to eq true
      expect(@instance.instance_variable_get('@numbers')).to eq ['12.']
    end
  end

  context '.check_for_float_marks(comma)' do
    it 'succeeds' do
      @instance.instance_variable_set('@number', '12')

      @instance.check_for_float_marks(',')
      expect(@instance.instance_variable_get('@number')).to eq '12.'

      @instance.check_for_float_marks(',')
      expect(@instance.instance_variable_get('@number').empty?).to eq true
      expect(@instance.instance_variable_get('@numbers')).to eq ['12.']
    end
  end

  context '.search_for_target_char(char)' do
    it 'succeeds' do
      @instance.instance_variable_set('@number', '12')

      @instance.search_for_target_char('5')
      expect(@instance.instance_variable_get('@number')).to eq '125'

      @instance.search_for_target_char('A')
      expect(@instance.instance_variable_get('@number').empty?).to eq true
      expect(@instance.instance_variable_get('@numbers')).to eq ['125']
    end
  end
end
