type HeaderProps = Required<{
  readonly title: string;
}>;

export const Header = ({ title }: HeaderProps) => {
  return (
    <header id="gHeader" className="bg-slate-800 text-white font-bold p-4">
      <h1 className="text-2xl">{title}</h1>
    </header>
  );
};