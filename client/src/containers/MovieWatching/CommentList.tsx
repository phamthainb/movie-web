import { request } from 'api/axios';
import API_URL from 'api/url';

import { useEffect } from 'react';

import { useDispatch, useSelector } from 'react-redux';
import { useHistory, useParams } from 'react-router-dom';
import CommentPost from './CommentPost';
import { getComment } from './store/actions';

import { selectMovieWatchingStore } from './store/selecters';

export default function CommentList() {
  const { data, comments, reloadComment } = useSelector(
    selectMovieWatchingStore,
  );
  const his = useHistory();
  const { movieId } = useParams<{ movieId: any }>();
  const dispatch = useDispatch();

  useEffect(() => {
    request({ method: 'GET', url: API_URL.COMMENT.GET_BY_MOVIE(movieId) }).then(
      res => {
        dispatch(getComment(res.data));
      },
    );
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [movieId, reloadComment]);

  return (
    <div className="col-12 col-lg-8 col-xl-8">
      {/* content tabs */}
      <div className="tab-content">
        <div
          className="tab-pane fade show active"
          id="tab-1"
          role="tabpanel"
          aria-labelledby="1-tab"
        >
          <div className="row">
            {/* comments */}
            <div className="col-12">
              <div className="comments">
                <ul className="comments__list">
                  {comments &&
                    comments?.length > 0 &&
                    comments?.map((c, i) => (
                      <li className="comments__item">
                        <div className="comments__autor">
                          <img
                            className="comments__avatar"
                            src="/img/user.svg"
                            alt=""
                          />
                          <span className="comments__name">
                            {c.account.username}
                          </span>
                          <span className="comments__time">
                            {new Date(c.createdAt).toLocaleDateString()}
                          </span>
                        </div>
                        <p className="comments__text">{c.content}</p>
                        <div className="comments__actions"></div>
                      </li>
                    ))}
                </ul>
                {localStorage.getItem('token') ? (
                  <CommentPost />
                ) : (
                  <button
                    type="button"
                    className="form__btn"
                    onClick={() => {
                      his.push('/signin');
                    }}
                  >
                    Login to comment
                  </button>
                )}
              </div>
            </div>
            {/* end comments */}
          </div>
        </div>
      </div>
      {/* end content tabs */}
    </div>
  );
}
