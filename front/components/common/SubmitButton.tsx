const SubmitButton = ({label}: {label: string}) => {
  return (
    <div className='flex justify-center'>
    <button className="mt-5 mb-5 w-20 h-10 outline rounded-md outline-1 text-white outline-gray-300 bg-blue-500 hover:bg-blue-400 shadow-md" type="submit">
      {label}
    </button>
  </div>
  )
}
export default SubmitButton;