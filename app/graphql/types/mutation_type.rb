# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World"
    # end

    field :update_comapny, mutation: Mutations::UpdateCompany
    field :update_office, mutation: Mutations::UpdateOffice
  end
end
