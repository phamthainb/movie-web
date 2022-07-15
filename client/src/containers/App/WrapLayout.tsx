import Footer from 'components/Footer';
import Header from 'components/Header';

interface Props {
  children: JSX.Element;
}

export default function WrapLayout({ children }: Props) {
  return (
    <>
      <Header />
      <>{children}</>
      <Footer />
    </>
  );
}
