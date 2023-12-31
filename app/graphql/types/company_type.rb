module Types
  class CompanyType < Types::BaseObject
    description "会社マスタ"
    field :id, ID, null: false
    field :name, String, null: false, description: '名前'
    field :post_code1, String, null: false, description: '郵便番号1'
    field :post_code2, String, null: false, description: '郵便番号2'
    field :prefecture_id, ID, null: false, description: '都道府県ID'
    field :prefecture_name, String, null: false, description: '都道府県'
    field :address, String, null: false, description: '住所'
    field :building, String, null: false, description: '建物名'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'

    def prefecture_name
      object.prefecture.name
    end

  end
end