/* eslint-disable jsx-a11y/anchor-is-valid */
/**
 *
 * Header
 *
 */
import { requestToken } from 'api/axios';
import API_URL from 'api/url';
import { changeUser } from 'containers/App/store/actions';
import { selectAppStore } from 'containers/App/store/selecters';
import { memo, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link, useHistory } from 'react-router-dom';
import styled from 'styled-components';

interface Props {}

// eslint-disable-next-line
function Header({}: Props) {
  const { user } = useSelector(selectAppStore);
  const dis = useDispatch();
  const his = useHistory();

  useEffect(() => {
    const token = localStorage.getItem('token');
    if (token) {
      requestToken({ method: 'GET', url: API_URL.USER.Me }).then(res => {
        dis(changeUser(res.data));
      });
    }
  }, []);

  return (
    <StylesHeader>
      {/* header */}
      <header className="header">
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div className="header__content">
                {/* header logo */}
                <Link to="/" className="header__logo">
                  <img src="/img/logo.svg" alt="" />
                </Link>
                {/* end header logo */}
                {/* header nav */}
                <ul className="header__nav">
                  {/* dropdown */}
                  <li className="header__nav-item">
                    <Link className="dropdown-toggle header__nav-link" to="/">
                      Home
                    </Link>
                  </li>
                  {/* end dropdown */}
                  {/* dropdown */}
                  {/* <li className="header__nav-item">
                    <Link
                      className="dropdown-toggle header__nav-link"
                      to="/search"
                    >
                      Catalog
                    </Link>
                  </li> */}
                  <li className="header__nav-item">
                    <Link to="/help" className="header__nav-link">
                      Help
                    </Link>
                  </li>
                </ul>
                {/* end header nav */}
                {/* header auth */}
                <div className="header__auth">
                  <Link to="/search" className="header__search">
                    <button className="header__search-button" type="button">
                      <i className="icon ion-ios-search" />
                    </button>
                  </Link>

                  {/* dropdown */}
                  <div className="dropdown header__lang">
                    <a className="dropdown-toggle header__nav-link" href="#">
                      EN
                    </a>
                  </div>

                  {/* end dropdown */}
                  {user?.id ? (
                    <>
                      <a href="#" className="header__sign-in">
                        <span>{user?.username.slice(0, 10)}...</span>
                      </a>
                      <a
                        href="#"
                        className="header__sign-in"
                        onClick={e => {
                          e.preventDefault();
                          localStorage.clear();
                          his.push('/signin');
                        }}
                      >
                        <span>Logout</span>
                      </a>
                    </>
                  ) : (
                    <Link to="/signin" className="header__sign-in">
                      <span>sign in</span>
                    </Link>
                  )}
                </div>
                {/* end header auth */}
              </div>
            </div>
          </div>
        </div>
      </header>
      {/* end header */}
    </StylesHeader>
  );
}
const StylesHeader = styled.div``;

export default memo(Header);
