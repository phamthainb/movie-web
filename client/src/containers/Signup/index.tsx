/*
 *
 * Signup
 * make by phamthainb
 */

import ErrorBound from 'components/ErrorBound';
import { memo } from 'react';
import { useForm } from 'react-hook-form';
import useInjectReducer from 'redux/useInjectReducer';
import reducersSignup from './store/reducers';
import WrapSignup from './style';

interface Props {}

// eslint-disable-next-line
function Signup({}: Props) {
  useInjectReducer('Signup', reducersSignup);
  const { register, handleSubmit } = useForm();

  const onSumit = (data: any) => {
    console.log('data', data);
  };

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
                  <form
                    className="sign__form"
                    onSubmit={(e: any) => {
                      e.preventDefault();
                      const formData = new FormData(e.target);
                      const formProps = Object.fromEntries(formData);
                      console.log(formProps);
                    }}
                  >
                    <a href="index.html" className="sign__logo">
                      <img src="/img/logo.svg" alt="" />
                    </a>

                    <div className="sign__group">
                      <input
                        type="text"
                        className="sign__input"
                        placeholder="Email"
                        name="email"
                      />
                    </div>

                    <div className="sign__group">
                      <input
                        type="password"
                        className="sign__input"
                        placeholder="Password"
                        name="password"
                      />
                    </div>

                    <div className="sign__group sign__group--checkbox">
                      <input id="remember" name="remember" type="checkbox" />
                      <label htmlFor="remember">
                        I agree to the <a href="privacy.html">Privacy Policy</a>
                      </label>
                    </div>

                    <button
                      className="sign__btn"
                      onSubmit={(e: any) => {
                        e.preventDefault();
                        const formData = new FormData(e.target);
                        const formProps = Object.fromEntries(formData);
                        console.log(formProps);
                      }}
                      type="submit"
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
