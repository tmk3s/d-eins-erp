# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 初期化
# docker-compose exec app bundle exec rails db:drop db:create
# docker-compose exec app bundle exec ridgepole -c config/database.yml -f db/Schemafile --apply
# docker-compose exec app bundle exec rake master:create
# docker-compose exec app bundle exec rake standard_monthly_remunerations:create
# docker-compose exec app bundle exec rake association_kenpo:create
# docker-compose exec app bundle exec rails db:seed


# alphabet = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
# ActiveRecord::Base.transaction do
#   5.times do |j|
#     company = Company.create(name: "テスト会社#{j}")

#     main_office = Offices.create(company_id: company.id, name: "本社#{j}")
#     sub_office = Offices.create(company_id: company.id, name: "支社#{j}")

#     d1 = Department.create(company_id: company.id, start_on: Date.new(2020, 1, 1), name: "部署A#{j}")
#     d2 = Department.create(company_id: company.id, start_on: Date.new(2020, 1, 1), name: "部署B#{j}")
#     d3 = Department.create(company_id: company.id, start_on: Date.new(2020, 1, 1), name: "部署C#{j}")
#     d4 = Department.create(company_id: company.id, start_on: Date.new(2022, 1, 1), name: "部署D#{j}")
#     d5 = Department.create(company_id: company.id, start_on: Date.new(2022, 1, 1), name: "部署E#{j}")
#     d6 = Department.create(company_id: company.id, start_on: Date.new(2022, 1, 1), name: "部署F#{j}")

#     p1 = Post.create(company_id: company.id, start_on: Date.new(2020, 1, 1), name: "役職A#{j}")
#     p2 = Post.create(company_id: company.id, start_on: Date.new(2020, 1, 1), name: "役職B#{j}")
#     p3 = Post.create(company_id: company.id, start_on: Date.new(2020, 1, 1), name: "役職C#{j}")
#     p4 = Post.create(company_id: company.id, start_on: Date.new(2022, 1, 1), name: "役職D#{j}")
#     p5 = Post.create(company_id: company.id, start_on: Date.new(2022, 1, 1), name: "役職E#{j}")
#     p6 = Post.create(company_id: company.id, start_on: Date.new(2022, 1, 1), name: "役職F#{j}")

#     o1 = Occupation.create(company_id: company.id, start_on: Date.new(2020, 1, 1), name: "職種A#{j}")
#     o2 = Occupation.create(company_id: company.id, start_on: Date.new(2020, 1, 1), name: "職種B#{j}")
#     o3 = Occupation.create(company_id: company.id, start_on: Date.new(2020, 1, 1), name: "職種C#{j}")
#     o4 = Occupation.create(company_id: company.id, start_on: Date.new(2022, 1, 1), name: "職種D#{j}")
#     o5 = Occupation.create(company_id: company.id, start_on: Date.new(2022, 1, 1), name: "職種E#{j}")
#     o6 = Occupation.create(company_id: company.id, start_on: Date.new(2022, 1, 1), name: "職種F#{j}")

#     grade1 = Grade.create(company_id: company.id, name: "ブロンズ")
#     grade2 = Grade.create(company_id: company.id, name: "シルバー")
#     grade3 = Grade.create(company_id: company.id, name: "ゴールド")
#     grade4 = Grade.create(company_id: company.id, name: "プラチナ")

#     pg = PayrollGroup.create(company_id: company.id, name: "給与グループ：15締25日支給", close_day: 15, payment_day: 25)

#     ai1 = AttendanceItem.cerate(company_id: company.id, name: "総労働時間", is_delete: 0)
#     ai2 = AttendanceItem.cerate(company_id: company.id, name: "総労働日数", is_delete: 0)
#     ai3 = AttendanceItem.cerate(company_id: company.id, name: "残業時間", is_delete: 0)
#     ai4 = AttendanceItem.cerate(company_id: company.id, name: "深夜残業時間", is_delete: 0)

#     di1 = DeductionItem.cerate(company_id: company.id, name: "健康保険料", item_type: :health, setting_type: :employee, is_minus: false, is_delete: 0)
#     di2 = DeductionItem.cerate(company_id: company.id, name: "介護保険料", item_type: :nursing, setting_type: :employee, is_minus: false, is_delete: 0)
#     di3 = DeductionItem.cerate(company_id: company.id, name: "厚生年金保険料", item_type: :pension, setting_type: :employee, is_minus: false, is_delete: 0)
#     di4 = DeductionItem.cerate(company_id: company.id, name: "子供子育て支援金", item_type: :child, setting_type: :employee, is_minus: false, is_delete: 0)
#     di5 = DeductionItem.cerate(company_id: company.id, name: "所得税", item_type: :customize, setting_type: :employee, is_minus: false, is_delete: 0)

#     pi1 = PaymentItem.cerate(company_id: company.id, name: "基本給", item_type: :base, setting_type: :employee, is_minus: false, is_delete: 0)
#     pi2 = PaymentItem.cerate(company_id: company.id, name: "残業手当", item_type: :customize, setting_type: :employee, is_minus: false, is_delete: 0)
#     pi3 = PaymentItem.cerate(company_id: company.id, name: "職能給", item_type: :customize, setting_type: :employee, is_minus: false, is_delete: 0)

#     PayrollGroupAttendanceItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 1, attendance_item_id: ai1.id)
#     PayrollGroupAttendanceItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 2, attendance_item_id: ai2.id)
#     PayrollGroupAttendanceItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 3, attendance_item_id: ai3.id)
#     PayrollGroupAttendanceItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 4, attendance_item_id: ai4.id)

#     PayrollGroupDeductionItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 1, deduction_item_id: di1.id)
#     PayrollGroupDeductionItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 2, deduction_item_id: di2.id)
#     PayrollGroupDeductionItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 3, deduction_item_id: di3.id)
#     PayrollGroupDeductionItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 4, deduction_item_id: di4.id)
#     PayrollGroupDeductionItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 5, deduction_item_id: di5.id)

#     PayrollGroupPaymentItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 1, payment_item_id: pi1.id)
#     PayrollGroupPaymentItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 2, payment_item_id: pi2.id)
#     PayrollGroupPaymentItem.create(company_id: company.id, payroll_group_id: pg.id, row_no: 3, payment_item_id: pi3.id)

#     q1 = Qualification.create(company_id: company.id, name: '基本情報技術者')
#     q2 = Qualification.create(company_id: company.id, name: '応用情報技術者')

#     params = []
#     1000.times do |i|
#       params << {
#         company_id: company.id,
#         code: "#{alphabet[rand(1..25)]}-#{rand(1..2000)}",
#         last_name: "田中#{i}",
#         first_name: "#{i}太郎",
#         last_name_kana: 'テスト',
#         first_name_kana: 'データ',
#         gender: rand(0..1),
#         birthday: Date.new(rand(1950..2000), rand(1..12), rand(1..28)),
#         joined_on:  Date.new(rand(2001..2020), rand(1..12), rand(1..28)),
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     Employee.insert_all(params)

#     params = []
#     Employee.all.each do |i|
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         post_code1: '123',
#         post_code2: '4567',
#         prefecture_id: Prefecture.all.first.id,
#         address:"東京の#{i.id}" 
#         building:"マンション#{i.id}号室" 
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     EmployeeAddress.insert_all(params)

#     params = []
#     Employee.all.each do |i|
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         row_no: 1,
#         post_code2: '4567',
#         bank_id: Bank.all.first.id,
#         bank_branche_id: BankBranche.all.first.id,
#         bank_number: '000099999',
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     EmployeeBank.insert_all(params)


#     params = []
#     Employee.all.each do |i|
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         row_no: 1,
#         relationship: :husband,
#         last_name: "田中#{i}",
#         first_name: "#{i}太郎",
#         last_name_kana: 'テスト',
#         first_name_kana: 'データ',
#         gender: rand(0..1),
#         birthday: Date.new(rand(1950..2000), rand(1..12), rand(1..28)),
#         joined_on:  Date.new(rand(2001..2020), rand(1..12), rand(1..28)),
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         row_no: 2,
#         relationship: :sister,
#         last_name: "佐藤#{i}",
#         first_name: "#{i}子",
#         last_name_kana: 'サトウ',
#         first_name_kana: 'テスコ',
#         gender: rand(0..1),
#         birthday: Date.new(rand(1950..2000), rand(1..12), rand(1..28)),
#         joined_on:  Date.new(rand(2001..2020), rand(1..12), rand(1..28)),
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         row_no: 3,
#         relationship: :older_brother,
#         last_name: "鈴木#{i}",
#         first_name: "#{i}介",
#         last_name_kana: 'スズキ',
#         first_name_kana: 'テススケ',
#         gender: rand(0..1),
#         birthday: Date.new(rand(1950..2000), rand(1..12), rand(1..28)),
#         joined_on:  Date.new(rand(2001..2020), rand(1..12), rand(1..28)),
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     EmployeeFamily.insert_all(params)


#     params = []
#     Employee.all.each do |i|
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         start_on: Date.new(2021, 1, 1),
#         name: "#{i.id}に入社",
#         detail: "内容はもちろん、文字の丁寧さも見られており、それ自体も評価の対象となります。",
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         start_on: Date.new(2022, 4, 1),
#         name: "#{i.id}を退社し、AAAAAAに入社",
#         detail: "テストメモ",
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         start_on: Date.new(2024, 4, 1),
#         name: "起業する！",
#         detail: "OK",
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     EmployeeJobCareer.insert_all(params)

#     params = []
#     Employee.all.each do |i|
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         payroll_group_id: pg.id,
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     EmployeePayrollGroup.insert_all(params)

#     params = []
#     Employee.all.each do |i|
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         start_on: Date.new(2020, 4, 1),
#         office_id: main_office.id,
#         department_id: d3.id,
#         post_id: p4.id,
#         occupation_id: o6.id,
#         grade_id: grade3.id,
#         created_at: Date.today,
#         updated_at: Date.today
#       }

#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         start_on: Date.new(2023, 4, 1),
#         office_id: sub_office.id,
#         department_id: d1.id,
#         post_id: p2.id,
#         occupation_id: o5.id,
#         grade_id: grade1.id,
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     EmployeePersonnelChange.insert_all(params)

#     params = []
#     Employee.all.each do |i|
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         acquisition_at: Date.new(2004, 4, 1),
#         qualification_id: q1.id,
#         created_at: Date.today,
#         updated_at: Date.today
#       }

#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         acquisition_at: Date.new(2007, 10, 1),
#         qualification_id: q2.id,
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     EmployeeQualification.insert_all(params)

#     params = []
#     Employee.all.each do |i|
#       params << {
#         company_id: company.id,
#         employee_id:i.id,
#         payroll_group_id: pg.id,
#         payment_date: Date.new(2023, 4, 25),
#         total_payment: 20000,
#         total_deduction: 4000,
#         deductible_payment_amount: 16000,
#         is_confirm: true,
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     EmployeeSalary.insert_all(params)

#     params = []
#     EmployeeSalary.all.each do |i|
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         attendance_item_id: ai1.id,
#         row_no: 1,
#         name: '総労働時間',
#         value: '160:00',
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       },
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         attendance_item_id: ai2.id,
#         row_no: 2,
#         name: '総労働日数',
#         value: '20',
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       },
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         attendance_item_id: ai2.id,
#         row_no: 3,
#         name: '残業時間',
#         value: '5:00',
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       },
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         attendance_item_id: ai2.id,
#         row_no: 4,
#         name: '深夜残業時間',
#         value: '2:00',
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     EmployeeSalaryAttendanceItem.insert_all(params)

#     params = []
#     EmployeeSalary.all.each do |i|
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         deduction_item_id: di1.id,
#         row_no: 1,
#         name: '健康保険料',
#         value: '1000',
#         item_type: :health, 
#         setting_type: :employee,
#         is_minus: false,
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       },
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         deduction_item_id: di2.id,
#         row_no: 2,
#         name: '介護保険料',
#         value: '300',
#         item_type: :nursing,
#         setting_type: :employee,
#         is_minus: false,
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       },
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         attendance_item_id: di3.id,
#         row_no: 3,
#         name: '厚生年金保険料',
#         value: '100',
#         item_type: :pension,
#         setting_type: :employee,
#         is_minus: false,
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       },
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         attendance_item_id: di4.id,
#         row_no: 4,
#         name: '子供子育て支援金',
#         value: '400',
#         item_type: :child,
#         setting_type: :employee,
#         is_minus: false,
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         attendance_item_id: di5.id,
#         row_no: 5,
#         name: '所得税',
#         value: '2200',
#         item_type: :child,
#         setting_type: :customize,
#         is_minus: false,
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     EmployeeSalaryDeductionItem.insert_all(params)

#     params = []
#     EmployeeSalary.all.each do |i|
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         attendance_item_id: pi1.id,
#         row_no: 1,
#         name: '基本給',
#         value: '16000',
#         item_type: :base,
#         setting_type: :employee,
#         is_minus: false,
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       },
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         attendance_item_id: pi2.id,
#         row_no: 2,
#         name: '残業手当',
#         value: '1000',
#         item_type: :customize,
#         setting_type: :employee,
#         is_minus: false,
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       },
#       params << {
#         company_id: company.id,
#         employee_salary_id:i.id,
#         payroll_group_id: pg.id,
#         attendance_item_id: pi3.id,
#         row_no: 3,
#         name: '職能給',
#         value: '3000',
#         item_type: :customize,
#         setting_type: :employee,
#         is_minus: false,
#         is_delete: false,
#         created_at: Date.today,
#         updated_at: Date.today
#       }
#     end
#     EmployeeSalaryPaymentItem.insert_all(params)
#   end
# end