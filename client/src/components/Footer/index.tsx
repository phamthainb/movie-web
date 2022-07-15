/**
 *
 * Footer
 *
 */
import { memo } from 'react';
import styled from 'styled-components';

interface Props {}

// eslint-disable-next-line
function Footer({}: Props) {
  return (
    <StylesFooter>
      {/* footer */}
      <footer className="footer">
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div className="footer__content">
                <a href="index.html" className="footer__logo">
                  <img src="img/logo.svg" alt="" />
                </a>
                <span className="footer__copyright">
                  © 2020 HotFlix
                  <br /> Create by{' '}
                  <a
                    href="https://themeforest.net/user/dmitryvolkov/portfolio"
                    target="_blank"
                    rel="noreferrer"
                  >
                    Dmitry Volkov
                  </a>
                </span>
                <nav className="footer__nav">
                  <a href="about.html">About Us</a>
                  <a href="contacts.html">Contacts</a>
                  <a href="privacy.html">Privacy Policy</a>
                </nav>
                <button className="footer__back" type="button">
                  <i className="icon ion-ios-arrow-round-up" />
                </button>
              </div>
            </div>
          </div>
        </div>
      </footer>
      {/* end footer */}
    </StylesFooter>
  );
}
const StylesFooter = styled.div``;

export default memo(Footer);
