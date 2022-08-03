/**
 *
 * NotFoundPage
 *
 */
import { memo } from 'react';
import styled from 'styled-components';

interface Props {}

// eslint-disable-next-line
function NotFoundPage({}: Props) {
  return (
    <StylesNotFoundPage>
      <div
        className="page-404 section--bg"
        data-bg="img/section/section.jpg"
        style={{
          background:
            'url("img/section/section.jpg") center center / cover no-repeat',
        }}
      >
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div className="page-404__wrap">
                <div className="page-404__content">
                  <h1 className="page-404__title">404</h1>
                  <p className="page-404__text">
                    The page you are looking for not available!
                  </p>
                  <a href="/" className="page-404__btn">
                    go back
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </StylesNotFoundPage>
  );
}
const StylesNotFoundPage = styled.div``;

export default memo(NotFoundPage);
