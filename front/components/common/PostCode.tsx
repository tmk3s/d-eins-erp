import Input from './Input'
import Label from './Label'

const PostCode = ({ label, register, ...props }: {label: string, register: any }) => {
  return (
    <div className='p-5'>
      <Label label={label}/>
      <Input className='w-10 h-10 mr-2 outline outline-1 outline-gray-300' {...register("postCode1")}/>
      -
      <Input className='w-12 h-10 ml-2 outline outline-1 outline-gray-300' {...register("postCode2")}/>
    </div>
  )
}

export default PostCode;