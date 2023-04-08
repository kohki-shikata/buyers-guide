import type { ReactElement } from 'react'
import Head from 'next/head'
import Link from 'next/link'
import { Layout } from '../../layouts/Layout'
import type { NextPageWithLayout } from '../_app'
import { OrderCard } from '../../components/orders/OrderCard'

import { useState, useEffect } from 'react';

const Page: NextPageWithLayout = () => {
  const [orders, setOrders] = useState([])

  useEffect(() => {
    const fetchShops = async () => {
      const response = await fetch('http://localhost:8000/records/Orders?join=Order_Products&join=Order_Products,Shops&include=Orders.id,Orders.status,Orders.created_at,Products.name,Order_Products.quantity,Order_Products.unit,Order_Products.budget_price,Order_Products.max_price,Shops.name&join=Order_Products,Products');
      const data = await response.json();
      setOrders(data.records)
    }
    fetchShops()  
    console.log(orders)
  }, [])

  return (
    <div className="main p-8">
      <div className="wrapper">
        {orders ? orders.map(order => <OrderCard data={order} />) : 'Order data does not exist.'}
      </div>
    </div>
  )
}

Page.getLayout = function getLayout(page: ReactElement) {
  return (
    <>
      <Head>
        <title>Orders :: Buyers' Guide</title>
      </Head>
      <Layout title="Orders :: Buyers' Guide">
        {page}
      </Layout>
    </>
  )
}

export default Page