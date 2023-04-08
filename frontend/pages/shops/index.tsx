import type { ReactElement } from 'react'
import Head from 'next/head'
import Link from 'next/link'
import { Layout } from '../../layouts/Layout'
import type { NextPageWithLayout } from '../_app'
import { ShopCard } from '../../components/shops/ShopCard'

import { useState, useEffect } from 'react';

const Page: NextPageWithLayout = () => {
  const [shops, setShops] = useState([])

  useEffect(() => {
    const fetchShops = async () => {
      const response = await fetch('http://localhost:8000/records/Shops');
      const data = await response.json();
      setShops(data.records)
    }
    fetchShops()  
    console.log(shops)
  }, [])

  return (
    <div className="main p-8">
      <div className="wrapper grid md:grid-cols-2 gap-4">
        {shops ? shops.map(shop => <ShopCard data={shop} />) : 'Shop data does not exist.'}
      </div>
    </div>
  )
}

Page.getLayout = function getLayout(page: ReactElement) {
  return (
    <>
      <Head>
        <title>Shops :: Buyers' Guide</title>
      </Head>
      <Layout title="Shops :: Buyers' Guide">
        {page}
      </Layout>
    </>
  )
}

export default Page