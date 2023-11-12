require "csv"
require 'roo'
require 'roo-xls'

# bundle exec rake standard_monthly_remunerations:create
namespace :standard_monthly_remunerations do
  desc "標準報酬月額を作成する"
  task create: :environment do
    standard_monthly_remunerations = []
    standard_monthly_remunerations += build_before_h28(Date.new(1000, 1, 1), Roo::Excel.new('db/health_insurance/association_kempo/h23/20110809-110056.xls')) # 一番古いデータなのでMYSQLの最小値を使用する
    standard_monthly_remunerations += build(Date.new(2016, 3, 1), Roo::Excelx.new('db/health_insurance/association_kempo/h28/h28ippan0512.xlsx'))
    standard_monthly_remunerations += build(Date.new(2016, 4, 1), Roo::Excelx.new('db/health_insurance/association_kempo/h28/h28ippan3.xlsx'))
    standard_monthly_remunerations += build(Date.new(2016, 10, 1), Roo::Excelx.new('db/health_insurance/association_kempo/h28/h280916.xlsx'))
    standard_monthly_remunerations += build(Date.new(2020, 9, 1), Roo::Excelx.new('db/health_insurance/association_kempo/r2/r2ippan9.xlsx'))
    StandardMonthlyRemuneration.import(
      standard_monthly_remunerations, 
      on_duplicate_key_update: [
        :insurance_type,
        :rank,
        :monthly_amount,
        :daily_amount,
        :monthly_remuneration_from,
        :monthly_remuneration_to
      ]
    )
  end
end

private

def build(date, excel)
  standard_monthly_remunerations = []
  sheet_name = excel.sheets.find{ _1.include?('北海道') } # 都道府県別ではないので北海道固定
  sheet = excel.sheet(sheet_name)
  # 12行目からstart
  # ランクは()なしは数値、ありは文字列
  # 0: rank, 1: 月額, 2: 報酬月額(from), 4: 報酬月額(to), 
  idx = 12
  is_first_build = true
  loop do
    row = sheet.row(idx)
    break if row[0].nil?

    health_rank = (row[0].class == Integer) ? row[0] : row[0].slice(/^[0-9]*/)
    standard_monthly_remunerations << StandardMonthlyRemuneration.new(
      start_on: date,
      insurance_type: :health,
      rank: health_rank,
      monthly_amount: row[1],
      daily_amount: nil,
      monthly_remuneration_from: row[2],
      monthly_remuneration_to: row[4]
    )

    if row[0].class != Integer
      next_row = sheet.row(idx + 1)
      is_last_data = row[0].class != next_row[0].class
      standard_monthly_remunerations << StandardMonthlyRemuneration.new(
        start_on: date,
        insurance_type: :pension,
        rank: row[0].slice(/(?<=（).*?(?=）)/),
        monthly_amount: row[1],
        daily_amount: nil,
        monthly_remuneration_from: is_first_build ? nil : row[2],
        monthly_remuneration_to: is_last_data ? nil : row[4]
      )
      is_first_build = false
    end
    idx += 1
  end
  standard_monthly_remunerations
end


def build_before_h28(date, excel)
  standard_monthly_remunerations = []
  sheet_name = excel.sheets.find{ _1.include?('北海道') } # 都道府県別ではないので北海道固定
  sheet = excel.sheet(sheet_name)
  # 15行目からstart
  # ランクは()なしは数値、ありは文字列
  # 1: rank, 2: 月額, 4: 日額, 6: 報酬月額(from), 8: 報酬月額(to), 
  idx = 15
  is_first_build = true
  loop do
    row = sheet.row(idx)
    break if row[1].nil?

    health_rank = (row[1].class == Float) ? row[1] : row[1].slice(/^[0-9]*/)
    standard_monthly_remunerations << StandardMonthlyRemuneration.new(
      start_on: date,
      insurance_type: :health,
      rank: health_rank,
      monthly_amount: row[2],
      daily_amount: row[4],
      monthly_remuneration_from: row[6],
      monthly_remuneration_to: row[8]
    )

    if  (row[1].class != Float)
      next_row = sheet.row(idx + 1)
      is_last_data = row[1].class != next_row[1].class
      standard_monthly_remunerations << StandardMonthlyRemuneration.new(
        start_on: date,
        insurance_type: :pension,
        rank: row[1].slice(/(?<=\().*?(?=\))/),
        monthly_amount: row[2],
        daily_amount: row[4],
        monthly_remuneration_from: is_first_build ? nil : row[6],
        monthly_remuneration_to: is_last_data ? nil : row[8]
      )
      is_first_build = false
    end

    idx += 1
  end
  standard_monthly_remunerations
end