import React, { forwardRef, ComponentPropsWithoutRef } from "react";
import { Field, FieldError } from "react-hook-form";
import Label from './Label'
import Textarea from './Textarea'

type LabelProps = {
  label: string;
  required?: boolean;
  error: FieldError | undefined;
}
type ChildProps = ComponentPropsWithoutRef<'textarea'> & LabelProps;
const TextBox = forwardRef<HTMLTextAreaElement, ChildProps>(
  ({ label,error, ...props }, ref) => {
    return (
      <div className='p-5'>
        <Label label={label} />
        <Textarea {...props} ref={ref} />
        { error && <p className='text-red-600'>{error.message}</p> }
      </div>
    )
  }
)
export default TextBox