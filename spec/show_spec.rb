# frozen_string_literal: true

require 'rspec'
require_relative '../lib/nmax/show'

RSpec.describe Show do
  before do
    @show = Show.new
    # subject { +described_class.new }

  end

  context 'when creating an instance of a class' do
    it 'the thread is initialized' do
      expect(@show.instance_variable_get('@hovercraft').alive?).to eq true
    end
  end

  context 'after summarize' do
    it 'the thread stops' do
      expect(@show.summarize.instance_variable_get('@hovercraft').nil?).to eq true
    end
  end
end
