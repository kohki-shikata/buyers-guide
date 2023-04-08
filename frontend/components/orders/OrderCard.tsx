import dayjs from 'dayjs'
import utc from "dayjs/plugin/utc";
import timezone from "dayjs/plugin/timezone";

dayjs.extend(utc);
dayjs.extend(timezone);
// dayjs.tz.setDefault("Asia/Tokyo");


type OrderProps = Required<{
  data: {
    id: number;
    status: string;
    created_at: string;
    Order_Products: Order_Products[]
  }
}>;

type Order_Products = {
  order_id: number;
  product_id: {
    id: number;
    name: string;
  }
  quantity: number;
  unit: string;
  budget_price: number;
  max_price: number;
  shop_id: {
    id: number;
    name: string;
  }
}

export const OrderCard: React.FC<OrderProps> = (data: OrderProps) => {
  const createdAtUTC = dayjs.tz(data.data.created_at, 'YYYY-MM-DD HH:mm:ss', 'UTC')
  const createdAt = createdAtUTC.tz('Asia/Tokyo').format('YYYY-MM-DD HH:mm:ss')
  return (
    <div className="orderCard gap-4 mb-4 p-4 bg-slate-100">
      <div className="description">
        <h2 className="font-bold text-2xl text-slate-600">{createdAt}</h2>
      </div>
    </div>
  );
};