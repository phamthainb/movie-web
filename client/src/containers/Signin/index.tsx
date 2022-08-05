/*
 *
 * Signin
 * make by phamthainb
 */

import ErrorBound from 'components/ErrorBound';
import { memo } from 'react';
import { useHistory, useLocation } from 'react-router-dom';
import useInjectReducer from 'redux/useInjectReducer';
import reducersSignin from './store/reducers';
import WrapSignin from './style';

interface Props {}

// eslint-disable-next-line
function Signin({}: Props) {
  useInjectReducer('Signin', reducersSignin);
  const location = useLocation();
  const history = useHistory();

  const token = new URLSearchParams(location.search).get('token');
  console.log('token', token);

  if (token) {
    localStorage.setItem('token', token);
    history.push('/');
  }
  return (
    <ErrorBound>
      <WrapSignin>
        {' '}
        <div
          className="sign section--bg"
          data-bg="img/section/section.jpg"
          style={{
            background:
              'url("img/section/section.jpg") center center / cover no-repeat',
          }}
        >
          <div className="container">
            <div className="row">
              <div className="col-12">
                <div className="sign__content">
                  {/* authorization form */}
                  <form action="#" className="sign__form">
                    <a href="index.html" className="sign__logo">
                      <img src="img/logo.svg" alt="" />
                    </a>
                    <div className="sign__group">
                      <input
                        type="text"
                        className="sign__input"
                        placeholder="Email"
                      />
                    </div>
                    <div className="sign__group">
                      <input
                        type="password"
                        className="sign__input"
                        placeholder="Password"
                      />
                    </div>
                    <div className="sign__group sign__group--checkbox">
                      <input
                        id="remember"
                        name="remember"
                        type="checkbox"
                        // defaultChecked="checked"
                      />
                      <label htmlFor="remember">Remember Me</label>
                    </div>
                    <button className="sign__btn" type="button">
                      Sign in
                    </button>
                    <span className="sign__text">
                      <a href="http://localhost:3000/google/login">
                        'http://localhost:3000/google/login
                      </a>
                      Don't have an account? <a href="signup.html">Sign up!</a>
                    </span>
                    <span className="sign__text">
                      <a href="forgot.html">Forgot password?</a>
                    </span>
                  </form>
                  {/* end authorization form */}
                </div>
              </div>
            </div>
          </div>
        </div>
      </WrapSignin>
    </ErrorBound>
  );
}
export default memo(Signin);
