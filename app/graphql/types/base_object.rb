# frozen_string_literal: true

module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    # https://stackoverflow.com/questions/51957480/how-to-pass-current-user-in-graphql-resolver
    def current_user
      context[:current_user]
    end
  end
end
