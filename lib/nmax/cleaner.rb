# frozen_string_literal: true

class Cleaner
  def self.clean(numbers, quantity)
    numbers
      .map(&:to_i)
      .uniq
      .sort
      .last(quantity)
  end
end
