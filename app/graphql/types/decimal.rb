# https://graphql-ruby.org/type_definitions/scalars.html
class Types::Decimal < Types::BaseScalar
  description "A valid Decimal, transported as a string"

  def self.coerce_input(input_value, context)
    input_value.to_d
  end

  def self.coerce_result(ruby_value, context)
    # It's transported as a string, so stringify it
    ruby_value.to_s
  end
end