/**
 *
 * Header
 *
 */
import { memo } from 'react';
import styled from 'styled-components';

interface Props {}

// eslint-disable-next-line
function Header({}: Props) {
  return (
    <StylesHeader>
      {/* header */}
      <header className="header">
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div className="header__content">
                {/* header logo */}
                <a href="index.html" className="header__logo">
                  <img src="img/logo.svg" alt="" />
                </a>
                {/* end header logo */}
                {/* header nav */}
                <ul className="header__nav">
                  {/* dropdown */}
                  <li className="header__nav-item">
                    <a className="dropdown-toggle header__nav-link" href="/">
                      Home
                    </a>
                  </li>
                  {/* end dropdown */}
                  {/* dropdown */}
                  <li className="header__nav-item">
                    <a
                      className="dropdown-toggle header__nav-link"
                      href="/search"
                    >
                      Catalog
                    </a>
                  </li>
                  {/* end dropdown */}
                  {/* <li className="header__nav-item">
                    <a href="pricing.html" className="header__nav-link">
                      Pricing Plan
                    </a>
                  </li> */}
                  <li className="header__nav-item">
                    <a href="/help" className="header__nav-link">
                      Help
                    </a>
                  </li>
                </ul>
                {/* end header nav */}
                {/* header auth */}
                <div className="header__auth">
                  <a href="/search" className="header__search">
                    <button className="header__search-button" type="button">
                      <i className="icon ion-ios-search" />
                    </button>
                  </a>

                  {/* dropdown */}
                  <div className="dropdown header__lang">
                    <a className="dropdown-toggle header__nav-link" href="#">
                      EN
                    </a>
                  </div>

                  {/* end dropdown */}
                  <a href="/signin" className="header__sign-in">
                    <i className="icon ion-ios-log-in" />
                    <span>sign in</span>
                  </a>
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
