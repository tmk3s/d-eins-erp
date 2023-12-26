"use client";

import { useState, useEffect } from 'react';
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

const UPDATE_COMPANY = gql`
  # Increments a back-end counter and gets its resulting value
  mutation updateComapny($UpdateCompanyInput: UpdateCompanyInput!){
  updateComapny(input: $UpdateCompanyInput) {
    errors
  }
}
`;

type Office = {
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

export default () => {
  useEffect(()=>{
	  console.log(1)
  },[])
  const [edit, setEdit] = useState(false);
  const { loading, error, refetch, data } = useQuery(GET_OFFICES,  { fetchPolicy: 'no-cache' });
  console.log(data)
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
                <table className="border-collapse table-auto w-full text-sm mt-5">
                  <thead>
                    <tr className='bg-neutral-300 border '>
                      <th className='font-bold p-4 pl-8 pt-3 pb-3 text-left'>事業所名</th>
                      <th className='font-bold p-4 pl-8 pt-3 pb-3 text-left'>作成日</th>
                      <th className='font-bold p-4 pl-8 pt-3 pb-3 text-left'>更新日</th>
                    </tr>
                  </thead>
                  <tbody className='class="bg-white dark:bg-slate-800"'>
                    {
                      data.offices.map((office: Office) => {
                        return (
                          <tr className='border bg-white hover:bg-gray-100'>
                            <td className='p-4 pl-8 pt-3 pb-3 text-left'>{office.name}</td>
                            <td className='p-4 pl-8 pt-3 pb-3 text-left'>{office.createdAt}</td>
                            <td className='p-4 pl-8 pt-3 pb-3 text-left'>{office.updatedAt}</td>
                          </tr>
                        )
                      })
                    }
                  </tbody>
                </table>
              </>
            )
          }
        </>
      </Layout>
    </main>  
  )
}
  