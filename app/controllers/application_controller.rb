class ApplicationController < ActionController::API
  include ValidateSchema
  include Pagy::Backend
  include PaginatedSerializer
end
