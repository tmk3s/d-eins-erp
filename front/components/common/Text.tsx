import React, { forwardRef, ComponentPropsWithoutRef } from "react";
import Input from './Input'
import Label from './Label'
import { Field, FieldError } from "react-hook-form";

type LabelProps = {
  label: string;
  required: boolean;
  error: FieldError | undefined;
}
type ChildProps = ComponentPropsWithoutRef<'input'> & LabelProps;
const Text = forwardRef<HTMLInputElement, ChildProps>(
  ({ label, error, ...props }, ref) => {
    return (
      <div className='p-5'>
        <Label label={label} required/>
        <Input {...props} ref={ref} />
        { error && <p className='text-red-600'>{error.message}</p> }
      </div>
    )
  }
)
export default Text