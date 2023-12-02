import React, { forwardRef, ComponentPropsWithoutRef } from "react";
import Label from './Label'
import Textarea from './Textarea'

type LabelProps = {
  label: string;
}
type ChildProps = ComponentPropsWithoutRef<'textarea'> & LabelProps;
const TextBox = forwardRef<HTMLTextAreaElement, ChildProps>(
  ({ label, ...props }, ref) => {
    return (
      <div className='p-5'>
        <Label label={label} />
        <Textarea {...props} ref={ref} />
      </div>
    )
  }
)
export default TextBox