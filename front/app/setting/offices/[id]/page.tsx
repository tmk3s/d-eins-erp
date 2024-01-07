"use client";

import { useState, useEffect } from 'react';
// import { query } from 'next/navigation'
import { useQuery, useMutation, gql } from '@apollo/client';
import { useForm, SubmitHandler } from "react-hook-form";
import Layout from '@/components/setting/Layout';
import Text from '@/components/common/Text';
import Input from '@/components/common/Input';
import ApiError from '@/components/common/ApiError';
import Select from '@/components/common/Select';
import PostCode from '@/components/common/PostCode';
import TextBox from '@/components/common/TextBox';
import ShowItem from '@/components/common/ShowItem';
import SubmitButton from '@/components/common/SubmitButton';
import type { Office } from '@/types/office';
import type { Prefacture } from '@/types/prefacture';

const GET_OFFICE = gql`
  query GetOffice($id: ID!) {
    office(id: $id){
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

const UPDATE_OFFICE = gql`
  # Increments a back-end counter and gets its resulting value
  mutation updateOffice($UpdateOfficeInput: UpdateOfficeInput!){
  updateOffice(input: $UpdateOfficeInput) {
    errors
  }
}
`;

const Show = ({office}: {office: Office}): React.ReactNode => {
  return (
    <div className='lg:grid lg:grid-cols-2 lg:gap-4'>
      <ShowItem label='社名' value={office.name}/>
      <ShowItem label='郵便番号' value={`${office.postCode1}-${office.postCode2}`}/>
      <ShowItem label='都道府県' value={office.prefectureName}/>
      <br/>
      <ShowItem label='丁目・番地' value={office.address}/>
      <ShowItem label='建物名' value={office.building}/>
      <ShowItem label='作成日' value={office.createdAt}/>
      <ShowItem label='更新日' value={office.updatedAt}/>
    </div>
  )
}

const Edit = ({office, prefectures, callBack}: {office: Office, prefectures: Prefacture[], callBack: ()=> void}): React.ReactNode => {
  const {
    register,
    handleSubmit,
    watch,
    formState: { errors }
  } = useForm({
    defaultValues: {
      name: office.name,
      postCode1: office.postCode1,
      postCode2: office.postCode2,
      prefectureId: office.prefectureId,
      address: office.address,
      building: office.building,
      createdAt: office.createdAt,
      updatedAt: office.updatedAt,
    }
  });
  // 更新に失敗(バリデーションエラー)してもonCompletedが実行されている
  // クエリそのもの(定義ミスとか)なら実行されないのでerorrsに入る正常終了として考える
  const [mutateFunction, { data, loading, error }] = useMutation(UPDATE_OFFICE, { 
    onCompleted(data) { 
      if (data.updateOffice.errors.length != 0) {return}
      callBack();
    }
  });
  return (
    <form
      onSubmit={handleSubmit((data) => {
        mutateFunction({
          variables: {
            UpdateOfficeInput: {
              id: office.id,
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
        // alert(JSON.stringify(office.id));
      })}
    >
      <>
        <ApiError errors={data?.updateOffice?.errors}/>
        {/* https://react-hook-form.com/docs/useform/register */}
        <div className='lg:grid lg:grid-cols-2 lg:gap-4'>
          <Text
            label='社名'
            error={errors.name}
            required
            {...register("name",
              { 
                required: '必須です',
                maxLength: { value: 50, message: '上限50文字です' }
              })}
          />
          <PostCode label='郵便番号' required errors={errors} register={register}/>
          <Select label='都道府県' selectItems={prefectures} {...register("prefectureId")}/>
          <br/>
          <TextBox
            label='丁目・番地'
            error={errors.address}
            {...register("address",
            { 
              maxLength: { value: 200, message: '上限200文字です' }
            })}
          />
          <TextBox
            label='建物名'
            error={errors.building}
            {...register("building",
            { 
              maxLength: { value: 200, message: '上限200文字です' }
            })}
          />
          <ShowItem label='作成日' value={office?.createdAt}/>
          <ShowItem label='更新日' value={office?.updatedAt}/>
        </div>
        <SubmitButton label='保存'/>
      </>
      
    </form>
  )
}


export default ({params, searchParams}: { params: any, searchParams: any }) => {
  console.log(params.id)
  console.log(searchParams)
  const [edit, setEdit] = useState(false);
  const id: String = params.id
  const { loading, error, refetch, data } = useQuery(GET_OFFICE,  { 
    fetchPolicy: 'no-cache',
    variables: { id }
  });
  return (
    <main>
      <Layout>
        <>
          <h1 className='text-3xl font-bold'>事業所情報</h1>
          <p className='mt-5'>事業所の基本情報の確認や編集ができます。</p>
          { loading || !data ? (
              <p>読み込み中です・・</p>
            ) : (
              
              <>
              <button className="mt-5 w-20 h-10 outline rounded-md outline-1 outline-gray-300 bg-slate-50 hover:bg-gray-100 shadow-md" type="button" onClick={() => { setEdit(!edit) }}>
                { edit ? '戻る' : '編集'}
              </button>
              <div className='mt-5 w-full outline rounded-md outline-1 outline-gray-300 bg-slate-50 shadow-md'>
                { edit ? (
                  <Edit office={data.office} prefectures={data.prefectures} callBack={() => {
                    setEdit(!edit);
                    refetch();
                  }
                  }/>
                  ) : (
                    <Show office={data.office}/>
                )}
              </div>
            </>
            )
          }
        </>
      </Layout>
    </main>  
  );
};