import React, { forwardRef, ComponentPropsWithoutRef } from "react";
import Label from './Label'

type SelectItem = {
  id: string,
  name: string
}
type SelectProps = {
  label: string,
  selectItems: SelectItem[]
}
type ChildProps = ComponentPropsWithoutRef<'select'> & SelectProps;
const Select = forwardRef<HTMLSelectElement, ChildProps>(
  ({ label, selectItems, ...props }, ref) => {
    return (
      <div className='p-5'>
      <Label label={label}/>
      <select className='w-full h-10 outline outline-1 outline-gray-300' {...props} ref={ref} >
        {
          selectItems.map((selectItem: SelectItem) => {
            return (
              <option key={selectItem.id} value={selectItem.id}>{selectItem.name}</option>
            )
          })
        }
      </select>
    </div>
    )
  }
)
export default Select;

