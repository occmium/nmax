# frozen_string_literal: true

require 'get_process_mem'

class Show
  def initialize
    @start_time = Time.now
    @hovercraft = Show.memory_tracking
  end

  def self.memory_tracking
    Thread.new do
      loop do
        mb = GetProcessMem.new.mb
        symbols = %w[\\ ― / |]
        4.times do |i|
          print " (#{symbols[i - 1]}) Использование памяти(MB): #{mb.round}\r"
          sleep 0.2
        end
      end
    end
  end

  def summarize
    @hovercraft.kill
    @waste_of_time = Time.now - @start_time
  end

  def to_s
    @waste_of_time.round(3).to_s
  end
end
