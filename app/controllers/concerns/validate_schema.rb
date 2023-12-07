# frozen_string_literal: true

module ValidateSchema
  def validate_schema(data, schema)
    schema_validation = schema.call(data.except(:action, :controller))
    raise 'There was an error in the parameters' if schema_validation.failure?

    schema_validation.to_h
  end
end
