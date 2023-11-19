class Mutations::UpdateCompany < Mutations::BaseMutation
  argument :id, ID
  argument :name, String
  argument :post_code1, String
  argument :post_code2, String
  argument :prefecture_id, ID
  argument :address, String
  argument :building, String

  field :errors, [String], null: false

  def resolve(id:, name:, post_code1:, post_code2:, prefecture_id:, address:, building:)
    company = Company.find(id)
    company.assign_attributes(id:, name:, post_code1:, post_code2:, prefecture_id:, address:, building:)
    if company.save
      # Successful creation, return the created object with no errors
      {
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        errors: company.errors.full_messages
      }
    end
  end
end