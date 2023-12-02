import React, { forwardRef, ComponentPropsWithoutRef } from "react";

type ChildProps = ComponentPropsWithoutRef<'input'>;
const Input = forwardRef<HTMLInputElement, ChildProps>(
  ({ ...props }, ref) => {
    return (
      <input className='w-full h-10 outline outline-1 outline-gray-300' {...props} ref={ref} />
    )
  }
)
export default Input