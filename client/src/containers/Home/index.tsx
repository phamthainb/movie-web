/*
 *
 * Home
 *
 */

import ErrorBound from 'components/ErrorBound';
import WrapLayout from 'containers/App/WrapLayout';
import { memo } from 'react';

import useInjectReducer from 'redux/useInjectReducer';
import About from './About';
import Content from './Content';
import Expected from './Expected';
import HomeBg from './HomeBg';
import reducersHome from './store/reducers';

interface Props {}

// eslint-disable-next-line
function Home({}: Props) {
  useInjectReducer('Home', reducersHome);

  return (
    <ErrorBound>
      <WrapLayout>
        <>
          <HomeBg />
          <Content />
          <Expected />
          <About />
        </>
      </WrapLayout>
    </ErrorBound>
  );
}

export default memo(Home);
