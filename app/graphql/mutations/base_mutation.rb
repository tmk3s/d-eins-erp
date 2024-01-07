# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    # https://stackoverflow.com/questions/51957480/how-to-pass-current-user-in-graphql-resolver
    def current_user
      context[:current_user]
    end
  end
end
