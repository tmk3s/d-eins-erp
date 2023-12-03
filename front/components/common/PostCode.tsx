import Input from './Input'
import Label from './Label'

const PostCode = ({ label, required, errors, register, ...props }: {label: string, required: boolean, errors: any, register: any }) => {
  console.log(errors)
  return (
    <div className='p-5'>
      <Label label={label} required/>
      <Input className='w-10 h-10 mr-2 outline outline-1 outline-gray-300'
        {...register("postCode1",
        { 
          required: '必須です',
          maxLength: { value: 3, message: '上限3文字です' },
          pattern: { value: /[0-9]{3}/, message: '半角数字のみ' }
        })}
      />
      -
      <Input className='w-12 h-10 ml-2 outline outline-1 outline-gray-300'
      {...register("postCode2",
      { 
        required: '必須です',
        maxLength: { value: 4, message: '上限4文字です' },
        pattern: { value: /[0-9]{4}/, message: '半角数字のみ' }
      })}/>
      { (errors.postCode1 || errors.postCode2) && <p className='text-red-600'>郵便番号は前半3桁、後半4桁で半角数字で入力してください</p> }
    </div>
  )
}

export default PostCode;