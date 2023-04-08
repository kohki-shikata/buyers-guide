import Image from "next/image";

type ShopProps = Required<{
  data: {
    id: number;
    name: string;
    image_file?: string;
  }
}>;

export const ShopCard: React.FC<ShopProps> = (data: ShopProps) => {
  // console.log(data.data.name)
  return (
    <div className="productCard grid grid-cols-[120px,_1fr] gap-4 mb-4 p-4 bg-slate-100">
      {data.data.image_file ? <Image src={data.data.image_file} alt={data.data.name + '\'s image'} /> : <div className="notFoundImage w-[120px] h-[120px] flex flex-col items-center justify-center bg-slate-200"><p>No image</p></div>}
      <div className="description">
        <h2 className="font-bold text-2xl text-slate-600">{data.data.name}</h2>
      </div>
    </div>
  );
};