"use client";

import { useState, useEffect } from 'react';
import Layout from '@/components/setting/Layout';
import { useQuery, gql } from '@apollo/client';
import { useForm, SubmitHandler } from "react-hook-form";

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

type Company = {
  name: string,
  postCode1: string,
  postCode2: string,
  prefectureName: string,
  address: string,
  building: string,
  createdAt: string,
  updatedAt: string
};

const Show = ({company}: {company: Company}): React.ReactNode => {
  return (
    <div className='lg:grid lg:grid-cols-2 lg:gap-4'>
      <div className='p-5'>
        <label className='text-gray-500 text-s'>社名</label>
        <p>{company.name}</p>
      </div>
      <div className='p-5'>
        <p className='text-gray-500 text-s'>郵便番号</p>
        <p>{company.postCode1}-{company.postCode2}</p>
      </div>
      <div className='p-5'>
        <p className='text-gray-500 text-s'>都道府県</p>
        <p>{company.prefectureName}</p>
      </div>
      <br/>
      <div className='p-5'>
        <p className='text-gray-500 text-s'>住所1</p>
        <p className='break-words'>{company.address}</p>
      </div>
      <div className='p-5'>
        <p className='text-gray-500 text-s'>住所2</p>
        <p className='break-words'>{company.building}</p>
      </div>
      <div className='p-5'>
        <p className='text-gray-500 text-s'>作成日</p>
        <p>{company.createdAt}</p>
      </div>
      <div className='p-5'>
        <p className='text-gray-500 text-s'>更新日</p>
        <p>{company.updatedAt}</p>
      </div>
    </div>
  )
}

const Edit = ({company}: {company: Company}): React.ReactNode => {
  const {
    register,
    handleSubmit,
    watch,
    formState: { errors }
  } = useForm({
    defaultValues: {
      name: company.name,
      postCode1: company.postCode1,
      postCode2: company.postCode2,
      prefectureName: company.prefectureName,
      address: company.address,
      building: company.building,
      createdAt: company.createdAt,
      updatedAt: company.updatedAt,
    }
  });

  return (
    <form
      onSubmit={handleSubmit((data) => {
        alert(JSON.stringify(data));
      })}
    >
      <div className='lg:grid lg:grid-cols-2 lg:gap-4'>
        <div className='p-5'>
          <p className='text-gray-500 text-s'>社名</p>
          <input className='w-full h-10 outline outline-1 outline-gray-300' {...register("name")} defaultValue='AAA' />
        </div>
        <div className='p-5'>
          <p className='text-gray-500 text-s'>郵便番号</p>
          <input className='w-10 h-10 outline outline-1 outline-gray-300' {...register("postCode1")} defaultValue={company?.postCode1} />
          -
          <input className='w-12 h-10 outline outline-1 outline-gray-300' {...register("postCode2")} defaultValue={company?.postCode2} />
        </div>
        <div className='p-5'>
          <p className='text-gray-500 text-s'>都道府県</p>
          <select className='w-full h-10 outline outline-1 outline-gray-300' {...register("prefectureName")}>
            <option value="東京都">東京都</option>
            <option value="male">北海道</option>
            <option value="other">埼玉県</option>
          </select>
        </div>
        <br/>
        <div className='p-5'>
          <p className='text-gray-500 text-s'>住所1</p>
          <textarea className='w-full h-20 outline outline-1 outline-gray-300' {...register("address")} defaultValue={company?.address} />
        </div>
        <div className='p-5'>
          <p className='text-gray-500 text-s'>住所2</p>
          <textarea className='w-full h-20 outline outline-1 outline-gray-300' {...register("building")} defaultValue={company?.building} />
        </div>
        <div className='p-5'>
          <p className='text-gray-500 text-s'>作成日</p>
          <p>{company?.createdAt}</p>
        </div>
        <div className='p-5'>
          <p className='text-gray-500 text-s'>更新日</p>
          <p>{company?.updatedAt}</p>
        </div>
      </div>
      <div className='flex justify-center'>
        <button className="mt-5 mb-5 w-20 h-10 outline rounded-md outline-1 text-white outline-gray-300 bg-blue-500 hover:bg-blue-400 shadow-md" type="submit">
          保存
        </button>
      </div>
    </form>
  )
}

export default function Home() {
  useEffect(()=>{
	  console.log(1)
  },[])
  const [edit, setEdit] = useState(false);
  const { loading, error, data } = useQuery(GET_COMPANY,  { fetchPolicy: 'no-cache' });

  return (
    <main>
      <Layout>
        <>
          <h1 className='text-3xl font-bold'>会社情報</h1>
          <p className='mt-5'>会社の基本情報の確認や編集ができます。</p>
          <h2 className='text-2xl mt-5'>基本情報</h2>
          <button className="mt-5 w-20 h-10 outline rounded-md outline-1 outline-gray-300 bg-slate-50 hover:bg-gray-100 shadow-md" type="button" onClick={() => { setEdit(!edit) }}>
            { edit ? '戻る' : '編集'}
          </button>
          <div className='mt-5 w-full outline rounded-md outline-1 outline-gray-300 bg-slate-50 shadow-md'>
            { !data ? (
              <p>読み込み中です・・</p>
            ) : (
              <>
                { edit ? (
                  <Edit company={data.company}/>
                ) : (
                  <Show company={data.company}/>
                )}
              </>
            )
          }
          </div>
        </>
      </Layout>
    </main>  
  )
}
  