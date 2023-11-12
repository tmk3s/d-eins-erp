module Types
  class EmployeeSalaryType < Types::BaseObject
    description "従業員給与"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :employee_id, ID, null: false, description: '従業員ID'
    field :payroll_group_id, ID, null: false, description: '給与グループID'
    field :payment_date, ISO8601Date, null: false, description: '支給日'
    field :total_payment, Int, null: false, description: '支給合計'
    field :total_deduction, Int, null: false, description: '控除合計'
    field :deductible_payment_amount, Int, null: false, description: '差引支給額'
    field :is_confirm, Boolean, null: false, description: '確定フラグ'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'

    field :employee_salary_attendance_items, [Types::EmployeeSalaryAttendanceItemType]
    field :employee_salary_deduction_items, [Types::EmployeeSalaryDeductionItemType]
    field :employee_salary_payment_items, [Types::EmployeeSalaryPaymentItemType]
  end
end