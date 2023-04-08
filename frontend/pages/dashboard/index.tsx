import type { ReactElement } from 'react'
import Head from 'next/head'
import Link from 'next/link'
import { Layout } from '../../layouts/Layout'
import type { NextPageWithLayout } from '../_app'

const Page: NextPageWithLayout = () => {
  return (
    <div className="main p-8">
      <div className="wrapper">

      </div>
      <nav className="menu">
        <ul className='grid grid-cols-2 grid-rows-2 gap-4'>
          <li><Link href="/orders" className="button w-full rounded-sm text-2xl py-8">Orders</Link></li>
          <li><Link href="/products" className="button w-full rounded-sm text-2xl py-8">Products</Link></li>
          <li><Link href="/categories" className="button w-full rounded-sm text-2xl py-8">Categories</Link></li>
          <li><Link href="/shops" className="button w-full rounded-sm text-2xl py-8">Shops</Link></li>
          <li><Link href="/preferences" className="button w-full rounded-sm text-2xl py-8">Preferences</Link></li>
        </ul>
      </nav>
    </div>
  )
}

Page.getLayout = function getLayout(page: ReactElement) {
  return (
    <>
      <Head>
        <title>Buyers' Guide</title>
      </Head>
      <Layout title="Dashboard :: Buyers' Guide">
        {page}
      </Layout>
    </>
  )
}

export default Page