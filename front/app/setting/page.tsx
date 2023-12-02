"use client";

import { useState, useEffect } from 'react';
import { useQuery, useMutation, gql } from '@apollo/client';
import { useForm, SubmitHandler } from "react-hook-form";
import Layout from '@/components/setting/Layout';
import Text from '@/components/common/Text';
import Input from '@/components/common/Input';
import Label from '@/components/common/Label';
import Select from '@/components/common/Select';
import PostCode from '@/components/common/PostCode';
import TextBox from '@/components/common/TextBox';
import ShowItem from '@/components/common/ShowItem';
import SubmitButton from '@/components/common/SubmitButton';



const GET_COMPANY = gql`
  query GetCompany {
    company(id: 11980){
      id
      name
      postCode1
      postCode2
      prefectureId
      prefectureName
      address
      building
      createdAt
      updatedAt
    }
    prefectures{
      id
      name
    }
  }
`;

const UPDATE_COMPANY = gql`
  # Increments a back-end counter and gets its resulting value
  mutation updateComapny($UpdateCompanyInput: UpdateCompanyInput!){
  updateComapny(input: $UpdateCompanyInput) {
    errors
  }
}
`;

type Company = {
  id: string,
  name: string,
  postCode1: string,
  postCode2: string,
  prefectureId: string,
  prefectureName: string,
  address: string,
  building: string,
  createdAt: string,
  updatedAt: string
};

type Prefacture = {
  id: string,
  name: string
};

const Show = ({company}: {company: Company}): React.ReactNode => {
  return (
    <div className='lg:grid lg:grid-cols-2 lg:gap-4'>
      <ShowItem label='社名' value={company.name}/>
      <ShowItem label='郵便番号' value={`${company.postCode1}-${company.postCode2}`}/>
      <ShowItem label='都道府県' value={company.prefectureName}/>
      <br/>
      <ShowItem label='丁目・番地' value={company.address}/>
      <ShowItem label='建物名' value={company.building}/>
      <ShowItem label='作成日' value={company.createdAt}/>
      <ShowItem label='更新日' value={company.updatedAt}/>
    </div>
  )
}

const Edit = ({company, prefectures, callBack}: {company: Company, prefectures: Prefacture[], callBack: ()=> void}): React.ReactNode => {
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
      prefectureId: company.prefectureId,
      address: company.address,
      building: company.building,
      createdAt: company.createdAt,
      updatedAt: company.updatedAt,
    }
  });
  const [mutateFunction, { data, loading, error }] = useMutation(UPDATE_COMPANY, { onCompleted() { callBack(); }});

  return (
    <form
      onSubmit={handleSubmit((data) => {
        mutateFunction({
          variables: {
            UpdateCompanyInput: {
              id: company.id,
              name: data.name,
              postCode1: data.postCode1,
              postCode2: data.postCode2,
              prefectureId: data.prefectureId,
              address: data.address,
              building: data.building,
            }
          }
        })
        // alert(JSON.stringify(data));
        // alert(JSON.stringify(company.id));
      })}
    >
      <div className='lg:grid lg:grid-cols-2 lg:gap-4'>
        <Text label='社名' {...register("name")}/>
        <PostCode label='郵便番号' register={register}/>
        <Select label='都道府県' selectItems={prefectures} {...register("prefectureId")}/>
        <br/>
        <TextBox label='丁目・番地'  {...register("address")}/>
        <TextBox label='建物名'  {...register("building")}/>
        <ShowItem label='作成日' value={company?.createdAt}/>
        <ShowItem label='更新日' value={company?.updatedAt}/>
      </div>
      <SubmitButton label='保存'/>
    </form>
  )
}

export default function Home() {
  useEffect(()=>{
	  console.log(1)
  },[])
  const [edit, setEdit] = useState(false);
  const { loading, error, refetch, data } = useQuery(GET_COMPANY,  { fetchPolicy: 'no-cache' });
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
            { loading || !data ? (
              <p>読み込み中です・・</p>
            ) : (
              <>
                { edit ? (
                  <Edit company={data.company} prefectures={data.prefectures} callBack={() => {
                    setEdit(!edit);
                    refetch();
                  }
                  }/>
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
  