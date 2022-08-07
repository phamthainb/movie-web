/*
 *
 * Signup
 * make by phamthainb
 */

import { requestInter } from 'api/axios';
import API_URL from 'api/url';
import ErrorBound from 'components/ErrorBound';
import REGEX from 'helpers/regex';
import { memo } from 'react';
import { useForm } from 'react-hook-form';
import toast from 'react-hot-toast';
import { useHistory } from 'react-router-dom';
import useInjectReducer from 'redux/useInjectReducer';
import reducersSignup from './store/reducers';
import WrapSignup from './style';

interface Props {}

// eslint-disable-next-line
function Signup({}: Props) {
  useInjectReducer('Signup', reducersSignup);
  const { register, handleSubmit, errors } = useForm();
  const his = useHistory();

  const onSumit = (data: any) => {
    requestInter({
      method: 'POST',
      url: API_URL.USER.REGISTER,
      data: { username: data?.email, password: data?.password },
    })
      .then(res => {
        toast('Login to continue');
        his.push('/signin');
      })
      .catch(err => {
        toast(err?.response.data.message ?? 'Some thing got error');
      });
  };

  return (
    <ErrorBound>
      <WrapSignup>
        <div
          className="sign section--bg"
          data-bg="img/section/section.jpg"
          style={{
            userSelect: 'none',
            background:
              'url("/img/section/section.jpg") center center / cover no-repeat',
          }}
        >
          <div className="container">
            <div className="row">
              <div className="col-12">
                <div className="sign__content">
                  {/* registration form */}
                  <form className="sign__form" onSubmit={handleSubmit(onSumit)}>
                    <a href="index.html" className="sign__logo">
                      <img src="/img/logo.svg" alt="" />
                    </a>

                    <div className="sign__group">
                      <input
                        ref={register({
                          required: true,
                          pattern: {
                            value: REGEX.EMAIL,
                            message: 'Email not correct',
                          },
                        })}
                        type="text"
                        className="sign__input"
                        placeholder="Email"
                        name="email"
                      />
                      {errors.email && errors.email.type === 'pattern' && (
                        <p style={{ color: 'red' }}>{errors.email.message}</p>
                      )}
                    </div>

                    <div className="sign__group">
                      <input
                        type="password"
                        className="sign__input"
                        placeholder="Password"
                        name="password"
                        ref={register({ required: true })}
                      />
                    </div>

                    <div className="sign__group sign__group--checkbox">
                      <input
                        id="remember"
                        name="remember"
                        type="checkbox"
                        ref={register({ required: true })}
                      />
                      <label htmlFor="remember">
                        I agree to the <a href="#">Privacy Policy</a>
                      </label>
                      {errors.remember && (
                        <p style={{ color: 'red' }}>This field is required</p>
                      )}
                    </div>

                    <button className="sign__btn" type="submit">
                      Sign up
                    </button>

                    <button className="sign__btn" type="button">
                      Sign up with Google
                    </button>
                    <span className="sign__text">
                      Already have an account? <a href="/signin">Sign in!</a>
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
