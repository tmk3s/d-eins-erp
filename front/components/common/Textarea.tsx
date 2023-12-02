import React, { forwardRef, ComponentPropsWithoutRef } from "react";

type ChildProps = ComponentPropsWithoutRef<'textarea'>;
const Textarea = forwardRef<HTMLTextAreaElement, ChildProps>(
  ({ ...props }, ref) => {
    return (
      <textarea className='w-full h-20 outline outline-1 outline-gray-300' {...props} ref={ref} />
    )
  }
)
export default Textarea