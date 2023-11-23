# frozen_string_literal: true

class StrategyBase
  attr_reader :params

  def initialize(params)
    @params = params
  end
end