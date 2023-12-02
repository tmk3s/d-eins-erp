import Label from './Label'

const ShowItem = ({ label, value }: {label: string, value: string }) => {
  return (
    <div className='p-5'>
      <Label label={label}/>
      <p>{value}</p>
    </div>
  )
}

export default ShowItem;