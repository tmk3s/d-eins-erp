require "csv"

# bundle exec rake master:create
namespace :master do
  desc "マスタを登録するタスク"
  task create: :environment do
    # 都道府県
    prefectures = []
    CSV.foreach("db/master/prefecture.csv", headers: true) do |row|
      prefectures << Prefecture.new(name: row['都道府県'])
    end
    Prefecture.import(prefectures, on_duplicate_key_update: [:name])

    # 銀行
    banks = []
    # BOM付きだとrow['正式銀行名']=>nilになるので、'rb:BOM|UTF-8'を指定
    CSV.foreach("db/master/bank.csv", 'rb:BOM|UTF-8', headers: true) do |row|
      # 銀行コードは重複している
      next if banks.find{ _1.code == row['銀行コード'] }.present? # 番号指定パラメータ

      banks << Bank.new(
        code: row['銀行コード'],
        name: row['正式銀行名'],
        name_ryaku: row['銀行名'],
        name_kana: row['銀行名（半角カナ）']
      )
    end
    Bank.import(banks, on_duplicate_key_update: [:code, :name, :name_ryaku, :name_kana])

    # 銀行支店
    bank_branches = []
    bank_cache = []
    CSV.foreach("db/master/bank.csv", 'rb:BOM|UTF-8', headers: true) do |row|
      hit = bank_cache.find{ _1.code == row['銀行コード'] }
      if hit.blank?
        bank = Bank.find_by(code: row['銀行コード'])
        bank_cache << bank
      end

      bank_branches << BankBranch.new(
        bank_id: hit&.id || bank.id,
        code: row['支店コード'],
        name: row['支店名'],
        name_kana: row['支店名（半角カナ）']
      )
    end
    BankBranch.import(bank_branches, on_duplicate_key_update: [:code, :name, :name_kana])

    # 郵便番号
    post_codes = []
    CSV.foreach("db/master/address.csv", headers: true) do |row|
      post_codes << PostCode.new(
        code: row['コード'],
        post_code: row['郵便番号'],
        prefecture_name: row['県名'],
        city_name: row['市区町村'],
        town_area_name: row['番地'],
        prefecture_name_kana: row['県名(カナ)'],
        city_name_kana: row['市区町村(カナ)'],
        town_area_name_kana: row['番地(カナ)']
      )
    end
    PostCode.import(post_codes, on_duplicate_key_update: [
      :code,
      :post_code,
      :prefecture_name,
      :city_name,
      :town_area_name,
      :prefecture_name_kana, 
      :city_name_kana,
      :town_area_name_kana
    ])
  end
end