require "csv"
require 'roo'
require 'roo-xls'

# bundle exec rake association_kenpo:create
namespace :association_kenpo do
  desc "協会けんぽの標準報酬月額表を登録するタスク"
  task create: :environment do
    rates = []
    rates += build_rates_before_h28(Date.new(1000, 1, 1), Date.new(1000, 1, 1), Date.new(1000, 1, 1), Roo::Excel.new('db/health_insurance/association_kempo/h23/20110809-110056.xls')) # 一番古いデータなのでMYSQLの最小値を使用する
    rates += build_rates_before_h28(Date.new(2012, 3, 1), Date.new(2012, 3, 1), Date.new(2012, 9, 1), Roo::Excel.new('db/health_insurance/association_kempo/h24/20120808-121339.xls'))
    rates += build_rates_before_h28(nil, nil, Date.new(2013, 9, 1), Roo::Excel.new('db/health_insurance/association_kempo/h25/20130218-195011.xls'))
    rates += build_rates_before_h28(nil, Date.new(2014, 3, 1), nil, Roo::Excelx.new('db/health_insurance/association_kempo/h26/1todoufuken.xlsx'))
    rates += build_rates_before_h28(nil, nil, Date.new(2014, 9, 1), Roo::Excelx.new('db/health_insurance/association_kempo/h26/todoufuken.xlsx'))
    rates += build_rates_before_h28(nil, Date.new(2015, 4, 1), nil, Roo::Excel.new('db/health_insurance/association_kempo/h27/h27ippan-1.xls'))
    rates += build_rates_before_h28(nil, nil, Date.new(2015, 9, 1), Roo::Excel.new('db/health_insurance/association_kempo/h27/h2709ippan-3.xls'))
    rates += build_rates(Date.new(2016, 3, 1), nil, nil, Roo::Excelx.new('db/health_insurance/association_kempo/h28/h28ippan0512.xlsx'))
    rates += build_rates(nil, nil, nil, Roo::Excelx.new('db/health_insurance/association_kempo/h28/h28ippan3.xlsx'))
    rates += build_rates(nil, nil, Date.new(2016, 9, 1), Roo::Excelx.new('db/health_insurance/association_kempo/h28/280822.xlsx'))
    rates += build_rates(nil, nil, nil, Roo::Excelx.new('db/health_insurance/association_kempo/h28/h280916.xlsx'))
    rates += build_rates(Date.new(2017, 3, 1), Date.new(2017, 3, 1), nil, Roo::Excelx.new('db/health_insurance/association_kempo/h29/h29ippan0210.xlsx'))
    rates += build_rates(nil, nil, nil, Roo::Excelx.new('db/health_insurance/association_kempo/h29/h29ippan4.xlsx'))
    rates += build_rates(nil, nil,  Date.new(2017, 9, 1), Roo::Excelx.new('db/health_insurance/association_kempo/h29/h29ippan9.xlsx'))
    rates += build_rates(Date.new(2018, 3, 1), Date.new(2018, 3, 1), nil, Roo::Excelx.new('db/health_insurance/association_kempo/h30/h30ippan4.xlsx'))
    rates += build_rates(nil, nil, nil, Roo::Excelx.new('db/health_insurance/association_kempo/h30/h30ippan3_2.xlsx'))
    rates += build_rates(nil, Date.new(2019, 3, 1), nil, Roo::Excelx.new('db/health_insurance/association_kempo/h31/h310402.xlsx'))
    rates += build_rates(nil, nil, nil, Roo::Excelx.new('db/health_insurance/association_kempo/h31/h31ippan3.xlsx'))
    rates += build_rates(Date.new(2020, 3, 1), Date.new(2020, 3, 1), nil, Roo::Excelx.new('db/health_insurance/association_kempo/r2/r2ippan3.xlsx'))
    rates += build_rates(nil, nil, nil, Roo::Excelx.new('db/health_insurance/association_kempo/r2/r2ippan4.xlsx'))
    rates += build_rates(nil, nil, nil, Roo::Excelx.new('db/health_insurance/association_kempo/r2/r2ippan9.xlsx'))
    rates += build_rates(Date.new(2021, 3, 1), Date.new(2021, 3, 1), nil, Roo::Excelx.new('db/health_insurance/association_kempo/r3/r3ippan3.xlsx'))
    rates += build_rates(Date.new(2022, 3, 1), Date.new(2022, 3, 1), nil, Roo::Excelx.new('db/health_insurance/association_kempo/r4/r4ippan3.xlsx'))
    rates += build_rates(Date.new(2023, 3, 1), Date.new(2023, 3, 1), nil, Roo::Excelx.new('db/health_insurance/association_kempo/r5/r5ippan3.xlsx'))
    rates += build_child_rate(Date.new(1000, 1, 1), 0.0013)
    rates += build_child_rate(Date.new(2014, 4, 1), 0.0015)
    rates += build_child_rate(Date.new(2016, 4, 1), 0.002)
    rates += build_child_rate(Date.new(2017, 4, 1), 0.0023)
    rates += build_child_rate(Date.new(2018, 4, 1), 0.0029)
    rates += build_child_rate(Date.new(2020, 4, 1), 0.0036)
    AssociationKenpoRate.import(
      rates, 
      on_duplicate_key_update: [
        :employee_rate,
        :employer_rate,
        :rate
      ]
    )
  rescue => e
    binding.pry
  end
end

private

def build_child_rate(date, rate)
  rates = []
  Prefecture.all.each do |prefecture|
    rates << AssociationKenpoRate.new(
      start_on: date,
      prefecture_id: prefecture.id,
      insurance_type: :child,
      employee_rate: 0,
      employer_rate: rate,
      rate: rate
    )
  end
  rates
end

def build_rates(health_date, nursing_date, pension_date, excel)
  rates = []
  Prefecture.all.each do |prefecture|
    sheet_name = excel.sheets.find{ _1.include?(prefecture.name.chop) }
    sheet = excel.sheet(sheet_name)
    row = sheet.row(9)
    # 健康
    if health_date
      rates << AssociationKenpoRate.new(
        start_on: health_date,
        prefecture_id: prefecture.id,
        insurance_type: :health,
        employee_rate: row.compact[2] / 2,
        employer_rate: row.compact[2] / 2,
        rate: row.compact[2]
      )
    end
    # 介護
    if nursing_date
      rates << AssociationKenpoRate.new(
        start_on: nursing_date,
        prefecture_id: prefecture.id,
        insurance_type: :nursing,
        employee_rate: (row.compact[3] - row.compact[2]) / 2,
        employer_rate: (row.compact[3] - row.compact[2]) / 2,
        rate: (row.compact[3] - row.compact[2])
      )
    end
    # 厚年
    if pension_date
      rates << AssociationKenpoRate.new(
        start_on: pension_date,
        prefecture_id: prefecture.id,
        insurance_type: :pension,
        employee_rate: row.compact[4] / 2,
        employer_rate: row.compact[4] / 2,
        rate: row.compact[4]
      )
    end
  rescue => e
    binding.pry
  end
  rates
end


def build_rates_before_h28(health_date, nursing_date, pension_date, excel)
  rates = []
  Prefecture.all.each do |prefecture|
    sheet_name = excel.sheets.find{ _1.include?(prefecture.name.chop) }
    sheet = excel.sheet(sheet_name)
    row = sheet.row(10)
    # 健康
    if health_date
      rates << AssociationKenpoRate.new(
        start_on: health_date,
        prefecture_id: prefecture.id,
        insurance_type: :health,
        employee_rate: row.compact[0] / 2,
        employer_rate: row.compact[0] / 2,
        rate: row.compact[0]
      )
    end
    # 介護
    if nursing_date
      rates << AssociationKenpoRate.new(
        start_on: nursing_date,
        prefecture_id: prefecture.id,
        insurance_type: :nursing,
        employee_rate: (row.compact[1] - row.compact[0]) / 2,
        employer_rate: (row.compact[1] - row.compact[0]) / 2,
        rate: (row.compact[1] - row.compact[0])
      )
    end
    # 厚年
    if pension_date
      rates << AssociationKenpoRate.new(
        start_on: pension_date,
        prefecture_id: prefecture.id,
        insurance_type: :pension,
        employee_rate: row.compact[2] / 2,
        employer_rate: row.compact[2] / 2,
        rate: row.compact[2]
      )
    end
  rescue => e
    binding.pry
  end
  rates
end