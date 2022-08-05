/*
 *
 * MovieWatching
 * make by phamthainb
 */

import { request } from 'api/axios';
import API_URL from 'api/url';
import ErrorBound from 'components/ErrorBound';
import WrapLayout from 'containers/App/WrapLayout';
import { memo, useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { useParams } from 'react-router-dom';
import useInjectReducer from 'redux/useInjectReducer';
import Discover from './Discover';
import Info from './Info';
import { get } from './store/actions';
import reducersMovieWatching from './store/reducers';
import WrapMovieWatching from './style';

interface Props {}

// eslint-disable-next-line
function MovieWatching({}: Props) {
  useInjectReducer('MovieWatching', reducersMovieWatching);

  const { movieId } = useParams<{ movieId: any }>();
  const dispatch = useDispatch();

  useEffect(() => {
    request({ method: 'GET', url: API_URL.MOVIE.GET_BY_ID(movieId) }).then(
      res => {
        dispatch(get(res.data));
      },
    );
  }, [movieId]);

  return (
    <ErrorBound>
      <WrapLayout>
        <WrapMovieWatching>
          <div>
            <Info />
            <Discover />
          </div>
        </WrapMovieWatching>
      </WrapLayout>
    </ErrorBound>
  );
}
export default memo(MovieWatching);
