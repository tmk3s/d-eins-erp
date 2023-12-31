module Types
  class OfficeType < Types::BaseObject
    description "事業所マスタ"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :name, String, null: false, description: '事業所'
    field :post_code1, String, null: true, description: '郵便番号1'
    field :post_code2, String, null: true, description: '郵便番号2'
    field :prefecture_id, ID, null: true, description: '都道府県ID'
    field :prefecture_name, String, null: false, description: '都道府県'
    field :address, String, null: true, description: '住所'
    field :building, String, null: true, description: '建物名'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'

    def prefecture_name
      object.prefecture&.name
    end
  end
end
