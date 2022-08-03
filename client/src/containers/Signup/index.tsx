/*
 *
 * Signup
 * make by phamthainb
 */

import ErrorBound from 'components/ErrorBound';
import { memo } from 'react';
import { useToasts } from 'react-toast-notifications';
import useInjectReducer from 'redux/useInjectReducer';
import reducersSignup from './store/reducers';
import WrapSignup from './style';

interface Props {}

// eslint-disable-next-line
function Signup({}: Props) {
  useInjectReducer('Signup', reducersSignup);

  const { addToast } = useToasts();
  return (
    <ErrorBound>
      <WrapSignup>
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
                  {/* registration form */}
                  <form action="#" className="sign__form">
                    <a href="index.html" className="sign__logo">
                      <img src="img/logo.svg" alt="" />
                    </a>
                    <div className="sign__group">
                      <input
                        type="text"
                        className="sign__input"
                        placeholder="Name"
                      />
                    </div>
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
                      <input id="remember" name="remember" type="checkbox" />
                      <label htmlFor="remember">
                        I agree to the <a href="privacy.html">Privacy Policy</a>
                      </label>
                    </div>
                    <button
                      onClick={() => {
                        addToast('hihi', { appearance: 'info' });
                      }}
                      className="sign__btn"
                      type="button"
                    >
                      Sign up
                    </button>
                    <button className="sign__btn" type="button">
                      Sign up with Google
                    </button>
                    <span className="sign__text">
                      Already have an account?{' '}
                      <a href="signin.html">Sign in!</a>
                    </span>
                  </form>
                  {/* registration form */}
                </div>
              </div>
            </div>
          </div>
        </div>
      </WrapSignup>
    </ErrorBound>
  );
}
export default memo(Signup);
