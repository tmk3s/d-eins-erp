import React, { forwardRef, ComponentPropsWithoutRef } from "react";
import Input from './Input'
import Label from './Label'

type LabelProps = {
  label: string;
}
type ChildProps = ComponentPropsWithoutRef<'input'> & LabelProps;
const Text = forwardRef<HTMLInputElement, ChildProps>(
  ({ label, ...props }, ref) => {
    return (
      <div className='p-5'>
        <Label label={label} />
        <Input {...props} ref={ref} />
      </div>
    )
  }
)
export default Text