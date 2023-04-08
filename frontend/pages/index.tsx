import type { ReactElement } from 'react'
import Head from 'next/head'
import { Layout } from '../layouts/Layout'
import type { NextPageWithLayout } from './_app'

const Page: NextPageWithLayout = () => {
  return (
    <form className="flex flex-col justify-center items-center h-full">
      <fieldset className="h-fit text-2xl">
        <div className="form-element">
          <label htmlFor="username">Name:</label>
          <input type="text" name="username" id="username" className="text-3xl" />
        </div>
        <div className="form-element">
          <label htmlFor="password">Password:</label>
          <input type="password" name="password" id="password" className="text-3xl" />
        </div>
        <button type="submit" className="button mt-5">Sign in</button>
      </fieldset>
    </form>
  )
}

Page.getLayout = function getLayout(page: ReactElement) {
  return (
    <>
      <Head>
        <title>Buyers' Guide</title>
      </Head>
      <Layout title="Buyers' Guide">
        {page}
      </Layout>
    </>
  )
}

export default Page