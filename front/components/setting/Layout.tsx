export default function Layout({children}: { children: React.ReactNode }) {
  return (
    <main>
      <div className="lg:flex lg:justify-center">
        <div className='Menu lg:w-60 lg:min-w-[240px] m-16 h-fit outline rounded-md outline-1 outline-gray-300 shadow-md'>
          <div className='bg-gray-200 h-16 font-bold pt-5 pl-3'>共通設定</div>
          <ul className='bg-white'>
            <li className='h-10 border-b-2 pt-2 pl-3 hover:bg-gray-100'>
              <a className='w-full h-full top-0 bottom-0 block' href="#">会社情報設定</a>
            </li>
            <li className='h-10 border-b-2 pt-2 pl-3 hover:bg-gray-100'>
              <a className='w-full h-full top-0 bottom-0 block' href="#">事業所設定</a>
            </li>
            <li className='h-10 border-b-2 pt-2 pl-3 hover:bg-gray-100'>
              <a className='w-full h-full top-0 bottom-0 block' href="#">給与情報設定</a>
            </li>
            <li className='h-10 border-b-2 pt-2 pl-3 hover:bg-gray-100'>
              <a className='w-full h-full top-0 bottom-0 block' href="#">組織情報設定</a>
            </li>
            <li className='h-10 border-b-2 pt-2 pl-3 hover:bg-gray-100'>
              <a className='w-full h-full top-0 bottom-0 block' href="#">資格情報設定</a>
            </li>
            <li className='h-10 border-b-2 pt-2 pl-3 hover:bg-gray-100'>
              <a className='w-full h-full top-0 bottom-0 block' href="#">IP制限設定</a>
            </li>
            <li className='h-10 pt-2 pl-3 hover:bg-gray-100'>
              <a className='w-full h-full top-0 bottom-0 block' href="#">権限設定</a>
            </li>
          </ul>
        </div>
        <div className='m-16 lg:w-[960px]'>
          {children}
        </div> 
      </div> 
    </main>  
  )
}
  