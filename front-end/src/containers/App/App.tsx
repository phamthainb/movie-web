import { ThemeProvider } from 'styled-components';
import { GlobalStyle } from 'styles/global-styles';
// css style configs
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
import NotFoundPage from 'components/NotFoundPage';
import Home from 'containers/Home';
import MovieWatching from 'containers/MovieWatching';
import { useSelector } from 'react-redux';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import LanguageProvider from './LanguageProvider';
import { selectAppStore } from './store/selecters';

function App() {
  const { loading } = useSelector(selectAppStore);

  return (
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
  );
}

export default App;
