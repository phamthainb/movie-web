/*
 *
 * SearchMovie
 * make by phamthainb
 */

import { requestInter } from 'api/axios';
import API_URL from 'api/url';
import ErrorBound from 'components/ErrorBound';
import WrapLayout from 'containers/App/WrapLayout';
import { memo, useEffect } from 'react';
import { useDispatch } from 'react-redux';
import useInjectReducer from 'redux/useInjectReducer';
import Data from './Data';
import Filter from './Filter';
import { changeData } from './store/actions';
import reducersSearchMovie from './store/reducers';
import WrapSearchMovie from './style';

interface Props {}

// eslint-disable-next-line
function SearchMovie({}: Props) {
  useInjectReducer('SearchMovie', reducersSearchMovie);
  const dis = useDispatch();

  useEffect(() => {
    requestInter({
      method: 'GET',
      url: API_URL.MOVIE.GET,
    })
      .then(res => {
        dis(changeData(res.data));
      })
      .catch();
  }, []);

  return (
    <ErrorBound>
      <WrapLayout>
        <WrapSearchMovie>
          <div>
            {/* page title */}
            <section
              className="section section--first section--bg"
              data-bg="img/section/section.jpg"
              style={{
                background:
                  'url("img/section/section.jpg") center center / cover no-repeat',
              }}
            >
              <div className="container">
                <div className="row">
                  <div className="col-12">
                    <div className="section__wrap">
                      {/* section title */}
                      <h2 className="section__title">Catalog</h2>
                      {/* end section title */}
                      {/* breadcrumb */}
                      <ul className="breadcrumb">
                        <li className="breadcrumb__item">
                          <a href="#">Home</a>
                        </li>
                        <li className="breadcrumb__item breadcrumb__item--active">
                          Catalog
                        </li>
                      </ul>
                      {/* end breadcrumb */}
                    </div>
                  </div>
                </div>
              </div>
            </section>
            {/* end page title */}
            {/* filter */}
            <Filter />
            {/* end filter */}
            {/* catalog */}
            <div className="catalog">
              <Data />
            </div>
            {/* end catalog */}
          </div>
        </WrapSearchMovie>
      </WrapLayout>
    </ErrorBound>
  );
}
export default memo(SearchMovie);
