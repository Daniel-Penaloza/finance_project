# frozen_string_literal: true

module PaginatedSerializer
  extend ActiveSupport::Concern

  def serialize_result(options, collection)
    custom_options(options).merge(collection)
  end

  def custom_options(options)
    { pages: options.pages, page_number: options.page, page_size: options.items, total_items: options.count }
  end
end
