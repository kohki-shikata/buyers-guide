// components/Layouts.tsx
import { ReactElement } from 'react';
import { Header } from '../components/common/Header';


type LayoutProps = Required<{
  readonly children: ReactElement;
  readonly title: string;
}>;


export const Layout = ({ children, title }: LayoutProps) => (
  <div className="flex flex-row items-center lg:items-start lg:h-auto bg-slate-200 lg:pt-8 lg:pb-8">
    <div id="screenWrapper" className="w-[768px] mx-auto h-auto aspect-[3/4] bg-slate-50">
      <Header title={title} />
      {children}
    </div>
  </div>
);