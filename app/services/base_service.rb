# frozen_string_literal: true

class BaseService
  attr_reader :params

  def initialize(**params)
    @params = params
  end
end