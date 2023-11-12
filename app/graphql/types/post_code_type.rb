module Types
  class PostCodeType < Types::BaseObject
    description "郵便番号マスタ"
    field :id, ID, null: false
    field :code, String, null: true, description: '団体コード'
    field :post_code, String, null: true, description: '郵便番号'
    field :prefecture_name, String, null: true, description: '都道府県名'
    field :city_name, String, null: true, description: '市区町村名'
    field :town_area_name, String, null: true, description: '町域名'
    field :prefecture_name_kana, String, null: true, description: '都道府県名(仮名)'
    field :city_name_kana, String, null: true, description: '市区町村(仮名)'
    field :town_area_name_kana, String, null: true, description: '町域名(仮名)'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end