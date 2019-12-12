# frozen_string_literal: true

require_relative 'data_handler'
require_relative 'cleaner'

class Executor
  DEFAULT_ARGUMENT = 5

  def initialize(text_data, argument)
    argument = DEFAULT_ARGUMENT if argument.nil?
    @argument = argument.to_i
    @text_data = text_data
    @all_numbers = []
  end

  def perform
    @text_data.each do |line|
      p = DataHandler.new(line)
      p.find_integers
      @all_numbers += p.numbers
    end
    @all_numbers = Cleaner.clean(@all_numbers, @argument)
  end

  def to_s
    @all_numbers.join("\n")
  end
end
