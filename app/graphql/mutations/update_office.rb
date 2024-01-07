class Mutations::UpdateOffice < Mutations::BaseMutation
  argument :id, ID
  argument :name, String
  argument :post_code1, String
  argument :post_code2, String
  argument :prefecture_id, ID
  argument :address, String
  argument :building, String

  field :errors, [String], null: false

  def resolve(id:, name:, post_code1:, post_code2:, prefecture_id:, address:, building:)
    office = current_user.company.offices.find(id)
    office.assign_attributes(id:, name:, post_code1:, post_code2:, prefecture_id:, address:, building:)
    if office.save
      # Successful creation, return the created object with no errors
      {
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        errors: office.errors.full_messages
      }
    end
  end
end
