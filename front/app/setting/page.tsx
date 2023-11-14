"use client";
import Layout from '@/components/setting/Layout';
import { useQuery, gql } from '@apollo/client';

const GET_COMPANY = gql`
  query GetCompany {
    company(id: 11980){
      name
      postCode1
      postCode2
      prefectureName
      address
      building
      createdAt
      updatedAt
    }
  }
`;

export default function Home() {
  const { loading, error, data } = useQuery(GET_COMPANY);
  console.log(data)
  return (
    <main>
      <Layout children={
        <>
          <h1 className='text-3xl font-bold'>会社情報</h1>
          <p className='mt-5'>会社の基本情報の確認や編集ができます。</p>
          <h2 className='text-2xl mt-5'>基本情報</h2>
          <div className='mt-5 w-full outline rounded-md outline-1 outline-gray-300 bg-slate-50 shadow-md lg:grid lg:grid-cols-2 lg:gap-4'>
            { loading ? (
              <p>読み込み中です・・</p>
            ) : (
              <>
                <div className='p-5'>
                  <label className='text-gray-500 text-s'>社名</label>
                  <p>{data.company.name}</p>
                </div>
                <div className='p-5'>
                  <p className='text-gray-500 text-s'>郵便番号</p>
                  <p>{data.company.postCode1}-{data.company.postCode2}</p>
                </div>
                <div className='p-5'>
                  <p className='text-gray-500 text-s'>都道府県</p>
                  <p>{data.company.prefectureName}</p>
                </div>
                <div className='p-5'>
                  <p className='text-gray-500 text-s'>住所1</p>
                  <p className='break-words'>{data.company.address}</p>
                </div>
                <div className='p-5'>
                  <p className='text-gray-500 text-s'>住所2</p>
                  <p className='break-words'>{data.company.building}</p>
                </div>
                <div className='p-5'>
                  <p className='text-gray-500 text-s'>作成日</p>
                  <p>{data.company.createdAt}</p>
                </div>
                <div className='p-5'>
                  <p className='text-gray-500 text-s'>更新日</p>
                  <p>{data.company.updatedAt}</p>
                </div>
              </>
            )
            
          }
          </div>
        </>
      }/>
    </main>  
  )
}
  