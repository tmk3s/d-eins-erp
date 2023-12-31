# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :company, CompanyType, "Find a employee by ID" do
      argument :id, ID
    end
    def company(id:)
      Company.all.first
    end

    field :employee, EmployeeType, "Find a employee by ID" do
      argument :id, ID
    end
    def employee(id:)
      Employee.find(id)
    end

    field :employees, [EmployeeType], null: false
    def employees
      Employee.all
    end

    field :prefectures, [PrefectureType], null: false
    def prefectures
      Prefecture.all
    end

    field :post_codes, [PostCodeType], null: false
    def post_codes
      PostCode.all
    end

    field :post_code, PostCodeType, null: false do
      argument :post_code, String
    end
    def post_code(post_code:)
      PostCode.find_by(post_code)
    end

    field :offices, [OfficeType], null: false
    def offices
      Office.where(company_id: current_user.company_id)
    end

    field :office, OfficeType, "Find a office by ID" do
      argument :id, ID
    end
    def office(id:)
      Office.find(id)
    end
  end
end
