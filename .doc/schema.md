# Schema Types

<details>
  <summary><strong>Table of Contents</strong></summary>

  * [Query](#query)
  * [Mutation](#mutation)
  * [Objects](#objects)
    * [Company](#company)
    * [Employee](#employee)
    * [EmployeeAddress](#employeeaddress)
    * [EmployeeBank](#employeebank)
    * [EmployeeFamily](#employeefamily)
    * [EmployeePayrollGroup](#employeepayrollgroup)
    * [EmployeeQualification](#employeequalification)
    * [EmployeeSalary](#employeesalary)
    * [EmployeeSalaryAttendanceItem](#employeesalaryattendanceitem)
    * [EmployeeSalaryDeductionItem](#employeesalarydeductionitem)
    * [EmployeeSalaryPaymentItem](#employeesalarypaymentitem)
    * [UpdateCompanyPayload](#updatecompanypayload)
  * [Inputs](#inputs)
    * [UpdateCompanyInput](#updatecompanyinput)
  * [Enums](#enums)
    * [Gender](#gender)
    * [ItemType](#itemtype)
    * [Relationship](#relationship)
  * [Scalars](#scalars)
    * [Boolean](#boolean)
    * [ID](#id)
    * [Int](#int)
    * [String](#string)

</details>

## Query
<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>company</strong></td>
<td valign="top"><a href="#company">Company</a></td>
<td>

Find a employee by ID

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employee</strong></td>
<td valign="top"><a href="#employee">Employee</a></td>
<td>

Find a employee by ID

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employees</strong></td>
<td valign="top">[<a href="#employee">Employee</a>!]!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>testField</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

An example field added by the generator

</td>
</tr>
</tbody>
</table>

## Mutation
<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>testField</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

An example field added by the generator

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updateComapny</strong></td>
<td valign="top"><a href="#updatecompanypayload">UpdateCompanyPayload</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#updatecompanyinput">UpdateCompanyInput</a>!</td>
<td>

Parameters for UpdateCompany

</td>
</tr>
</tbody>
</table>

## Objects

### Company

会社マスタ

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>address</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

住所

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>building</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

建物名

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createdAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

作成日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

名前

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>postCode1</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

郵便番号1

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>postCode2</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

郵便番号2

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>prefectureId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

都道府県ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>prefectureName</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

都道府県

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updatedAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

更新日

</td>
</tr>
</tbody>
</table>

### Employee

従業員

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>birthday</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

誕生日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>code</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

従業員番号

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>companyId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

会社ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createdAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

作成日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeAddress</strong></td>
<td valign="top"><a href="#employeeaddress">EmployeeAddress</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeBanks</strong></td>
<td valign="top">[<a href="#employeebank">EmployeeBank</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeFamilies</strong></td>
<td valign="top">[<a href="#employeefamily">EmployeeFamily</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeePayrollGroups</strong></td>
<td valign="top">[<a href="#employeepayrollgroup">EmployeePayrollGroup</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeQualifications</strong></td>
<td valign="top">[<a href="#employeequalification">EmployeeQualification</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeSalaries</strong></td>
<td valign="top">[<a href="#employeesalary">EmployeeSalary</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>firstName</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

名

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>firstNameKana</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

名(カナ)

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>gender</strong></td>
<td valign="top"><a href="#gender">Gender</a></td>
<td>

性別

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>image</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

画像

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>introduction</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

自己紹介

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>joinedOn</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

入社日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>lastName</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

姓

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>lastNameKana</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

姓(カナ)

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>retirementOn</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

退社日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updatedAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

更新日

</td>
</tr>
</tbody>
</table>

### EmployeeAddress

従業員住所

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>address</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

住所

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>building</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

建物名

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>companyId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

会社ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createdAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

作成日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

従業員ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>postCode1</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

郵便番号1

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>postCode2</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

郵便番号2

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>prefectureId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

都道府県ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updatedAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

更新日

</td>
</tr>
</tbody>
</table>

### EmployeeBank

従業員口座

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>bankBranchId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

銀行支店ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>bankId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

銀行ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>bankNumber</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

口座番号

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>companyId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

会社ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createdAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

作成日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

従業員ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>rowNo</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

行No

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updatedAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

更新日

</td>
</tr>
</tbody>
</table>

### EmployeeFamily

従業員家族

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>birthday</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

誕生日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>companyId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

会社ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createdAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

作成日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

従業員ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>firstName</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

名

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>firstNameKana</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

名(カナ)

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>gender</strong></td>
<td valign="top">[<a href="#gender">Gender</a>!]</td>
<td>

性別

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>lastName</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

姓

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>lastNameKana</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

姓(カナ)

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>relationship</strong></td>
<td valign="top">[<a href="#relationship">Relationship</a>!]!</td>
<td>

続柄

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>rowNo</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

行No

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updatedAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

更新日

</td>
</tr>
</tbody>
</table>

### EmployeePayrollGroup

従業員の給与グループ

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>companyId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

会社ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createdAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

作成日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

従業員ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>payrollGroupId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

給与グループID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updatedAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

更新日

</td>
</tr>
</tbody>
</table>

### EmployeeQualification

従業員資格情報

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>acquisitionAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

取得日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>companyId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

会社ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createdAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

作成日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

従業員ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>qualificationId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

資格ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updatedAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

更新日

</td>
</tr>
</tbody>
</table>

### EmployeeSalary

従業員給与

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>companyId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

会社ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createdAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

作成日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>deductiblePaymentAmount</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

差引支給額

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

従業員ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeSalaryAttendanceItems</strong></td>
<td valign="top">[<a href="#employeesalaryattendanceitem">EmployeeSalaryAttendanceItem</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeSalaryDeductionItems</strong></td>
<td valign="top">[<a href="#employeesalarydeductionitem">EmployeeSalaryDeductionItem</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeSalaryPaymentItems</strong></td>
<td valign="top">[<a href="#employeesalarypaymentitem">EmployeeSalaryPaymentItem</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>isConfirm</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

確定フラグ

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>paymentDate</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

支給日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>payrollGroupId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

給与グループID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>totalDeduction</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

控除合計

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>totalPayment</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

支給合計

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updatedAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

更新日

</td>
</tr>
</tbody>
</table>

### EmployeeSalaryAttendanceItem

従業員給与の勤怠項目

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>attendanceItemId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

勤怠項目ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>companyId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

会社ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createdAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

作成日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

従業員ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>isDelete</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

削除フラグ

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

項目名

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>rowNo</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

行No

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updatedAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

更新日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>value</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

値

</td>
</tr>
</tbody>
</table>

### EmployeeSalaryDeductionItem

従業員給与の控除項目

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>calculationProcessFile</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

計算過程のファイル

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>companyId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

会社ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createdAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

作成日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>deductionItemId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

控除項目ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

従業員ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>formula</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

計算式

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>isDelete</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

削除フラグ

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>isMinus</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

マイナスフラグ

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>itemType</strong></td>
<td valign="top">[<a href="#itemtype">ItemType</a>!]!</td>
<td>

項目種別

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

項目名

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>rowNo</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

行No

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>settingType</strong></td>
<td valign="top">[<a href="#itemtype">ItemType</a>!]!</td>
<td>

金額設定種別

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updatedAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

更新日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>value</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

値

</td>
</tr>
</tbody>
</table>

### EmployeeSalaryPaymentItem

従業員給与の支給項目

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>calculationProcessFile</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

計算過程のファイル

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>companyId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

会社ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createdAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

作成日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>employeeId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

従業員ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>formula</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

計算式

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>isDelete</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

削除フラグ

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>isMinus</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

マイナスフラグ

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>itemType</strong></td>
<td valign="top">[<a href="#itemtype">ItemType</a>!]!</td>
<td>

項目種別

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

項目名

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>paymentItemId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

支給項目ID

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>rowNo</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

行No

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>settingType</strong></td>
<td valign="top">[<a href="#itemtype">ItemType</a>!]!</td>
<td>

金額設定種別

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updatedAt</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

更新日

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>value</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

値

</td>
</tr>
</tbody>
</table>

### UpdateCompanyPayload

Autogenerated return type of UpdateCompany.

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>clientMutationId</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

A unique identifier for the client performing the mutation.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>errors</strong></td>
<td valign="top">[<a href="#string">String</a>!]!</td>
<td></td>
</tr>
</tbody>
</table>

## Inputs

### UpdateCompanyInput

Autogenerated input type of UpdateCompany

<table>
<thead>
<tr>
<th colspan="2" align="left">Field</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>clientMutationId</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

A unique identifier for the client performing the mutation.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>postCode1</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>postCode2</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>prefectureId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>address</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>building</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td></td>
</tr>
</tbody>
</table>

## Enums

### Gender

<table>
<thead>
<th align="left">Value</th>
<th align="left">Description</th>
</thead>
<tbody>
<tr>
<td valign="top"><strong>male</strong></td>
<td>

男

</td>
</tr>
<tr>
<td valign="top"><strong>female</strong></td>
<td>

女

</td>
</tr>
</tbody>
</table>

### ItemType

<table>
<thead>
<th align="left">Value</th>
<th align="left">Description</th>
</thead>
<tbody>
<tr>
<td valign="top"><strong>health</strong></td>
<td>

健康保険

</td>
</tr>
<tr>
<td valign="top"><strong>nursing</strong></td>
<td>

介護保険

</td>
</tr>
<tr>
<td valign="top"><strong>pension</strong></td>
<td>

厚生年金

</td>
</tr>
<tr>
<td valign="top"><strong>child</strong></td>
<td>

子供手当

</td>
</tr>
<tr>
<td valign="top"><strong>customize</strong></td>
<td>

カスタマイズ

</td>
</tr>
</tbody>
</table>

### Relationship

<table>
<thead>
<th align="left">Value</th>
<th align="left">Description</th>
</thead>
<tbody>
<tr>
<td valign="top"><strong>husband</strong></td>
<td>

夫

</td>
</tr>
<tr>
<td valign="top"><strong>wife</strong></td>
<td>

妻

</td>
</tr>
<tr>
<td valign="top"><strong>older_brother</strong></td>
<td>

兄

</td>
</tr>
<tr>
<td valign="top"><strong>younger_brother</strong></td>
<td>

弟

</td>
</tr>
<tr>
<td valign="top"><strong>sister</strong></td>
<td>

姉

</td>
</tr>
<tr>
<td valign="top"><strong>younger_sister</strong></td>
<td>

妹

</td>
</tr>
<tr>
<td valign="top"><strong>grandfather</strong></td>
<td>

祖父

</td>
</tr>
<tr>
<td valign="top"><strong>grandmother</strong></td>
<td>

祖母

</td>
</tr>
</tbody>
</table>

## Scalars

### Boolean

Represents `true` or `false` values.

### ID

Represents a unique identifier that is Base64 obfuscated. It is often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"VXNlci0xMA=="`) or integer (such as `4`) input value will be accepted as an ID.

### Int

Represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.

### String

Represents textual data as UTF-8 character sequences. This type is most often used by GraphQL to represent free-form human-readable text.

