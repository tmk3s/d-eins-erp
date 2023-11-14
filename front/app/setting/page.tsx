import Layout from '@/components/setting/Layout';

export default function Home() {
  return (
    <main>
      <Layout children={
        <>
          <h1 className='text-3xl font-bold'>会社情報</h1>
          <p className='mt-5'>会社の基本情報の確認や編集ができます。</p>
          <h2 className='text-2xl mt-5'>基本情報</h2>
          <div className='mt-5 w-full outline rounded-md outline-1 outline-gray-300 bg-slate-50 shadow-md lg:grid lg:grid-cols-2 lg:gap-4'>
            <div className='p-5'>
              <label className='text-gray-500 text-s'>社名</label>
              <p>株式会社ソニー</p>
            </div>
            <div className='p-5'>
              <p className='text-gray-500 text-s'>社名</p>
              <p>株式会社ソニー</p>
            </div>
            <div className='p-5'>
              <p className='text-gray-500 text-s'>社名</p>
              <p>株式会社ソニー</p>
            </div>
            <div className='p-5'>
              <p className='text-gray-500 text-s'>社名</p>
              <p>株式会社ソニー</p>
            </div>
            <div className='p-5'>
              <p className='text-gray-500 text-s'>社名</p>
              <p>株式会社ソニー</p>
            </div>
            <div className='p-5'>
              <p className='text-gray-500 text-s'>社名</p>
              <p>株式会社ソニー</p>
            </div>
          </div>
        </>
      }/>
    </main>  
  )
}
  