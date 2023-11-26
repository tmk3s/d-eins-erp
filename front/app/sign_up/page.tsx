"use client";

import { useForm, SubmitHandler } from "react-hook-form";
import axios from 'axios';

async function createUser(email: string, password: string) {
  try {
    const response = await axios.post('/auth', { email: email, password: password });
    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

export default function Home() {
  const {
    register,
    handleSubmit,
    watch,
    formState: { errors }
  } = useForm({
    defaultValues: {
      email: '',
      password: '',
    }
  });
  return (
    <form
      onSubmit={handleSubmit((data) => {
        createUser(data.email, data.password)
      })}
    >
      <main className="flex min-h-screen flex-col items-center justify-between p-24">
        <div className=''>
          <div className='p-5'>
            <p className='text-gray-500 text-s'>メールアドレス</p>
            <input className='w-full h-10 outline outline-1 outline-gray-300' {...register("email")} />
          </div>
          <div className='p-5'>
            <p className='text-gray-500 text-s'>パスワード</p>
            <input className='w-full h-10 outline outline-1 outline-gray-300' type='password' {...register("password")} />
          </div>
          <div className='flex justify-center'>
            <button className="mt-5 mb-5 w-20 h-10 outline rounded-md outline-1 text-white outline-gray-300 bg-blue-500 hover:bg-blue-400 shadow-md" type="submit">
              ログイン
            </button>
          </div>
        </div>
      </main>
    </form>
  )
}
