/*
 *
 * Signin
 * make by phamthainb
 */

import { requestInter } from 'api/axios';
import API_URL from 'api/url';
import ErrorBound from 'components/ErrorBound';
import { getPublic } from 'helpers';
import { memo } from 'react';
import { useForm } from 'react-hook-form';
import toast from 'react-hot-toast';
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

  const { register, handleSubmit, errors } = useForm();

  const onSumit = (data: any) => {
    requestInter({
      method: 'POST',
      url: API_URL.USER.LOGIN,
      data: { username: data?.email, password: data?.password },
    })
      .then(res => {
        localStorage.setItem('token', res.data);
        toast('Wellcome my fenn');
        history.push('/');
      })
      .catch(err => {
        toast(err?.response.data.message ?? 'Some thing got error');
      });
  };

  return (
    <ErrorBound>
      <WrapSignin>
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
                  <form onSubmit={handleSubmit(onSumit)} className="sign__form">
                    <a href="#" className="sign__logo">
                      <img src="/img/logo.svg" alt="" />
                    </a>
                    <div className="sign__group">
                      <input
                        ref={register({ required: true })}
                        type="text"
                        className="sign__input"
                        placeholder="Email"
                        name="email"
                      />
                    </div>
                    <div className="sign__group">
                      <input
                        ref={register({ required: true })}
                        type="password"
                        name="password"
                        className="sign__input"
                        placeholder="Password"
                      />
                    </div>

                    <button className="sign__btn" type="submit">
                      Sign in
                    </button>

                    <a
                      className="sign__btn"
                      type="button"
                      href={getPublic('google/login')}
                    >
                      Sign in with Google
                    </a>

                    <span className="sign__text">
                      Don't have an account? <a href="/signup">Sign up!</a>
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
