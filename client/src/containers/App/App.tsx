import { ThemeProvider } from 'styled-components';
import { GlobalStyle } from 'styles/global-styles';
// css style configs
import 'react-input-range/lib/css/index.css';
import 'styles/css/bootstrap-grid.min.css';
import 'styles/css/bootstrap-reboot.min.css';
import 'styles/css/default-skin.css';
import 'styles/css/ionicons.min.css';
import 'styles/css/jquery.mCustomScrollbar.min.css';
import 'styles/css/main.css';
import 'styles/css/nouislider.min.css';
import 'styles/css/owl.carousel.min.css';
import 'styles/css/photoswipe.css';
import 'styles/css/plyr.css';
import 'styles/fonts.css'; // import config font define
import theme from 'styles/theme';
import 'sweetalert2/dist/sweetalert2.min.css';
// diff import
import Loading from 'components/Loading';
import LoadingLazy from 'components/Loading/LoadingLazy';
import NotFoundPage from 'components/NotFoundPage';
import React, { Suspense } from 'react';
import { useSelector } from 'react-redux';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import LanguageProvider from './LanguageProvider';
import { selectAppStore } from './store/selecters';

const HelpPage = React.lazy(() => import('containers/HelpPage'));
const Home = React.lazy(() => import('containers/Home'));
const MovieWatching = React.lazy(() => import('containers/MovieWatching'));
const SearchMovie = React.lazy(() => import('containers/SearchMovie'));
const Signin = React.lazy(() => import('containers/Signin'));
const Signup = React.lazy(() => import('containers/Signup'));

function App() {
  const { loading } = useSelector(selectAppStore);

  return (
    <Suspense fallback={<LoadingLazy />}>
      <LanguageProvider>
        <ThemeProvider theme={theme}>
          <Router>
            <Switch>
              <Route exact path="/">
                <Home />
              </Route>

              <Route exact path="/watch">
                <MovieWatching />
              </Route>

              <Route exact path="/search">
                <SearchMovie />
              </Route>

              <Route exact path="/help">
                <HelpPage />
              </Route>

              <Route exact path="/signin">
                <Signin />
              </Route>

              <Route exact path="/signup">
                <Signup />
              </Route>

              <Route path="*">
                <NotFoundPage />
              </Route>
            </Switch>
          </Router>
          {/* // extra config global */}
          <Loading active={loading} />
          <GlobalStyle />
        </ThemeProvider>
      </LanguageProvider>
    </Suspense>
  );
}

export default App;
