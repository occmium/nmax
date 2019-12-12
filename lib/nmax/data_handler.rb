# frozen_string_literal: true

class DataHandler
  attr_reader :numbers

  MAX_OF_DIGITS = 1000
  FLOAT_POINT_SYMBOL = '.'
  FLOAT_MARKS = '.,'
  TARGET_CHARACTERS = ('0'..'9').freeze

  def initialize(string)
    @string = string
    @number = String.new
    @numbers = []
  end

  def find_integers
    @string.each_char do |char|
      search_for_target_char(char) unless check_for_float_marks(char)
    end
  end

  def check_for_float_marks(char)
    if FLOAT_MARKS.include?(char) &&
       @number != String.new
      if @number.include?(FLOAT_POINT_SYMBOL)
        @numbers << @number
        reset_number
      else
        @number += FLOAT_POINT_SYMBOL
      end
    end
  end

  def search_for_target_char(char)
    if (TARGET_CHARACTERS).include?(char)
      @number += char
    else
      @numbers << @number unless @number.empty? ||
                                 @number.length > MAX_OF_DIGITS
      reset_number
    end
  end

  def reset_number
    @number = String.new
  end
end
