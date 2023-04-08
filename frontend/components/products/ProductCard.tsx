import Image from "next/image";

type ProductProps = Required<{
  data: {
    id: number;
    name: string;
    jancode?: string;
    url?: string;
    image_file?: string;
    category_id: {
      id: number;
      name: string;
    }
  }
}>;

export const ProductCard: React.FC<ProductProps> = (data: ProductProps) => {
  console.log(data.data)
  return (
    <div className="productCard grid grid-cols-[120px,_1fr] gap-4 mb-4 p-4 bg-slate-100">
      {data.data.image_file ? <Image src={data.data.image_file} alt={data.data.name + '\'s image'} /> : <div className="notFoundImage w-[120px] h-[120px] flex flex-col items-center justify-center bg-slate-200"><p>No image</p></div>}
      <div className="description">
        <h2 className="font-bold text-2xl text-slate-600">
          <small className="bg-slate-600 text-white text-xs font-normal px-2 py-1 rounded-md inline-block mb-2">{data.data.category_id.name}</small>
          <br />
          {data.data.name}
        </h2>
      </div>
    </div>
  );
};