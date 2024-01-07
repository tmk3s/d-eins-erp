"use client";

import { useState, useEffect } from 'react';
import { useQuery, useMutation, gql } from '@apollo/client';
import { useForm, SubmitHandler } from "react-hook-form";
import Layout from '@/components/setting/Layout';
import type { Office } from '@/types/office';
import Text from '@/components/common/Text';
import Input from '@/components/common/Input';
import ApiError from '@/components/common/ApiError';
import Select from '@/components/common/Select';
import PostCode from '@/components/common/PostCode';
import TextBox from '@/components/common/TextBox';
import ShowItem from '@/components/common/ShowItem';
import SubmitButton from '@/components/common/SubmitButton';

const GET_OFFICES = gql`
  query GetOffices {
    offices{
      id
      name
      postCode1
      postCode2
      address
      building
      createdAt
      updatedAt
    }
  }
`;

// tailwindは{`grid grid-cols-&{header.length}`}みたいな書き方はできないので文字列を生成する
const gridCols = (length: Number): String => {
  switch (length) {
    case 3:
      return 'grid-cols-3';
    default:
      return '';
  }
}

const List = ({header, offices}: {header: Array<String>, offices: Array<Office>}): React.ReactNode => {
  return(
    <>
      <div className={`grid ${gridCols(header.length)} bg-gray-200 h-16 font-bold pt-5 pl-3`}>
        {   
          header.map((name: String) => {
            return (
              <div>{name}</div>
            )
          })
        }
      </div>
      {
        offices.map((office: Office) => {
          return (
            <a className={`grid ${gridCols(header.length)} border bg-white hover:bg-gray-100`}
              href={`/setting/offices/${office.id}`}
              // onClick={
              //   () => {
              //     alert(1)
              //   }
              // }
              >
              <span className='p-4 pl-8 pt-3 pb-3 text-left'>{office.name}</span>
              <span className='p-4 pl-8 pt-3 pb-3 text-left'>{office.createdAt}</span>
              <span className='p-4 pl-8 pt-3 pb-3 text-left'>{office.updatedAt}</span>
            </a>
          )
        })
      }
    </>
  )
}

export default () => {
  useEffect(()=>{
	  console.log(1)
  },[])
  const [edit, setEdit] = useState(false);
  const { loading, error, refetch, data } = useQuery(GET_OFFICES,  { fetchPolicy: 'no-cache' });
  const header: Array<String> = ['事業所名', '作成日', '更新日']
  return (
    <main>
      <Layout>
        <>
          <h1 className='text-3xl font-bold'>事業所情報</h1>
          <p className='mt-5'>事業所の基本情報の確認や編集ができます。</p>
          { loading || !data ? (
              <p>読み込み中です・・</p>
            ) : (
              <List header={header} offices={data.offices}/>
            )
          }
        </>
      </Layout>
    </main>  
  )
}
  