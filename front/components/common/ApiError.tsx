const ApiError = ({errors}: {errors: string[] | undefined}) => {
  return (
    (errors && errors.length != 0) && (
      <div className='p-5 text-red-600'>
        <p>エラーです</p>
        {
          errors.map((error: string) => {
            return (
              <p key={error}>{error}</p>
            )
          })
        }
      </div>
    )
  )
}
export default ApiError;