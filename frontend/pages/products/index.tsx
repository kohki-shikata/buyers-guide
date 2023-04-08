import type { ReactElement } from 'react'
import Head from 'next/head'
import Link from 'next/link'
import { Layout } from '../../layouts/Layout'
import { ProductCard } from '../../components/products/ProductCard'
import type { NextPageWithLayout } from '../_app'

import { useState, useEffect } from 'react';

const Page: NextPageWithLayout = () => {
  const [products, setProducts] = useState([])

  useEffect(() => {
    const fetchProducts = async () => {
      const response = await fetch('http://localhost:8000/records/Products?join=Categories&exclude=created_at,updated_at,description');
      const data = await response.json();
      setProducts(data.records)
    }
    fetchProducts()  
    console.log(products)
  }, [])

  return (
    <div className="main p-4 lg:p-8">
      <div className="wrapper grid md:grid-cols-2 gap-4">
        {products ? products.map(product => <ProductCard data={product} />) : 'Products data does not exist.'}
      </div>
    </div>
  )
}

Page.getLayout = function getLayout(page: ReactElement) {
  return (
    <>
      <Head>
        <title>Products :: Buyers' Guide</title>
      </Head>
      <Layout title="Products :: Buyers' Guide">
        {page}
      </Layout>
    </>
  )
}

export default Page