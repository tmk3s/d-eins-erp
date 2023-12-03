const Label = ({label, required = false}: {label: string, required?: boolean}) => {
  return (
    <p className='text-gray-500 text-s'>
      {label}{ required && <span className='text-red-600'>※</span>}
    </p>
  )
}
export default Label;