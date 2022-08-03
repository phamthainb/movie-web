/*
 *
 * MovieWatching
 * make by phamthainb
 */

import ErrorBound from 'components/ErrorBound';
import WrapLayout from 'containers/App/WrapLayout';
import { memo } from 'react';
import useInjectReducer from 'redux/useInjectReducer';
import reducersMovieWatching from './store/reducers';
import WrapMovieWatching from './style';

interface Props {}

// eslint-disable-next-line
function MovieWatching({}: Props) {
  useInjectReducer('MovieWatching', reducersMovieWatching);
  return (
    <ErrorBound>
      <WrapLayout>
        <WrapMovieWatching>
          <div>
            {/* details */}
            <section
              className="section section--details section--bg"
              data-bg="img/section/details.jpg"
            >
              {/* details content */}
              <div className="container">
                <div className="row">
                  {/* title */}
                  <div className="col-12">
                    <h1 className="section__title">
                      I Dream in Another Language
                    </h1>
                  </div>
                  {/* end title */}
                  {/* content */}
                  <div className="col-12 col-lg-6">
                    <div className="card card--details">
                      <div className="row">
                        {/* card cover */}
                        <div className="col-12 col-sm-5 col-lg-6 col-xl-5">
                          <div className="card__cover">
                            <img src="img/covers/cover.jpg" alt="" />
                            <span className="card__rate card__rate--green">
                              8.4
                            </span>
                          </div>
                        </div>
                        {/* end card cover */}
                        {/* card content */}
                        <div className="col-12 col-sm-7 col-lg-6 col-xl-7">
                          <div className="card__content">
                            <ul className="card__meta">
                              <li>
                                <span>Director:</span> Vince Gilligan
                              </li>
                              <li>
                                <span>Cast:</span>{' '}
                                <a href="#">Brian Cranston</a>{' '}
                                <a href="#">Jesse Plemons</a>{' '}
                                <a href="#">Matt Jones</a>{' '}
                                <a href="#">Jonathan Banks</a>,{' '}
                                <a href="#">Charles Baker</a>{' '}
                                <a href="#">Tess Harper</a>
                              </li>
                              <li>
                                <span>Genre:</span> <a href="#">Action</a>
                                <a href="#">Triler</a>
                              </li>
                              <li>
                                <span>Release year:</span> 2019
                              </li>
                              <li>
                                <span>Running time:</span> 130 min
                              </li>
                              <li>
                                <span>Country:</span> <a href="#">USA</a>
                              </li>
                            </ul>
                            <div className="card__description">
                              It is a long established fact that a reader will
                              be distracted by the readable content of a page
                              when looking at its layout. The point of using
                              Lorem Ipsum is that it has a more-or-less normal
                              distribution of letters, as opposed to using
                              'Content here, content here', making it look like
                              readable English. Many desktop publishing packages
                              and web page editors now use Lorem Ipsum as their
                              default model text, and a search for 'lorem ipsum'
                              will uncover many web sites still in their
                              infancy.
                            </div>
                          </div>
                        </div>
                        {/* end card content */}
                      </div>
                    </div>
                  </div>
                  {/* end content */}
                  {/* player */}
                  <div className="col-12 col-lg-6">
                    <video
                      controls
                      playsInline
                      poster="demo/View_From_A_Blue_Moon_Trailer-HD.jpg"
                      id="player"
                    >
                      {/* Video files */}
                      <source
                        src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-576p.mp4"
                        type="video/mp4"
                      />
                      <source
                        src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-720p.mp4"
                        type="video/mp4"
                      />
                      <source
                        src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-1080p.mp4"
                        type="video/mp4"
                      />
                      {/* Caption files */}
                      <track
                        kind="captions"
                        label="English"
                        srcLang="en"
                        src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-HD.en.vtt"
                        default
                      />
                      <track
                        kind="captions"
                        label="Français"
                        srcLang="fr"
                        src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-HD.fr.vtt"
                      />
                      {/* Fallback for browsers that don't support the <video> element */}
                      <a
                        href="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-576p.mp4"
                        download
                      >
                        Download
                      </a>
                    </video>
                  </div>
                  {/* end player */}
                </div>
              </div>
              {/* end details content */}
            </section>
            {/* end details */}
            {/* content */}
            <section className="content">
              <div className="content__head">
                <div className="container">
                  <div className="row">
                    <div className="col-12">
                      {/* content title */}
                      <h2 className="content__title">Discover</h2>
                      {/* end content title */}
                      {/* content tabs nav */}
                      <ul
                        className="nav nav-tabs content__tabs"
                        id="content__tabs"
                        role="tablist"
                      >
                        <li className="nav-item">
                          <a
                            className="nav-link active"
                            data-toggle="tab"
                            href="#tab-1"
                            role="tab"
                            aria-controls="tab-1"
                            aria-selected="true"
                          >
                            Comments
                          </a>
                        </li>
                      </ul>
                      {/* end content tabs nav */}
                    </div>
                  </div>
                </div>
              </div>
              <div className="container">
                <div className="row">
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
                                <li className="comments__item">
                                  <div className="comments__autor">
                                    <img
                                      className="comments__avatar"
                                      src="img/user.svg"
                                      alt=""
                                    />
                                    <span className="comments__name">
                                      John Doe
                                    </span>
                                    <span className="comments__time">
                                      30.08.2018, 17:53
                                    </span>
                                  </div>
                                  <p className="comments__text">
                                    There are many variations of passages of
                                    Lorem Ipsum available, but the majority have
                                    suffered alteration in some form, by
                                    injected humour, or randomised words which
                                    don't look even slightly believable. If you
                                    are going to use a passage of Lorem Ipsum,
                                    you need to be sure there isn't anything
                                    embarrassing hidden in the middle of text.
                                  </p>
                                  <div className="comments__actions">
                                    <div className="comments__rate">
                                      <button type="button">
                                        <i className="icon ion-md-thumbs-up" />
                                        12
                                      </button>
                                      <button type="button">
                                        7
                                        <i className="icon ion-md-thumbs-down" />
                                      </button>
                                    </div>
                                    <button type="button">
                                      <i className="icon ion-ios-share-alt" />
                                      Reply
                                    </button>
                                    <button type="button">
                                      <i className="icon ion-ios-quote" />
                                      Quote
                                    </button>
                                  </div>
                                </li>
                                <li className="comments__item comments__item--answer">
                                  <div className="comments__autor">
                                    <img
                                      className="comments__avatar"
                                      src="img/user.svg"
                                      alt=""
                                    />
                                    <span className="comments__name">
                                      John Doe
                                    </span>
                                    <span className="comments__time">
                                      24.08.2018, 16:41
                                    </span>
                                  </div>
                                  <p className="comments__text">
                                    Lorem Ipsum is simply dummy text of the
                                    printing and typesetting industry. Lorem
                                    Ipsum has been the industry's standard dummy
                                    text ever since the 1500s, when an unknown
                                    printer took a galley of type and scrambled
                                    it to make a type specimen book.
                                  </p>
                                  <div className="comments__actions">
                                    <div className="comments__rate">
                                      <button type="button">
                                        <i className="icon ion-md-thumbs-up" />8
                                      </button>
                                      <button type="button">
                                        3
                                        <i className="icon ion-md-thumbs-down" />
                                      </button>
                                    </div>
                                    <button type="button">
                                      <i className="icon ion-ios-share-alt" />
                                      Reply
                                    </button>
                                    <button type="button">
                                      <i className="icon ion-ios-quote" />
                                      Quote
                                    </button>
                                  </div>
                                </li>
                                <li className="comments__item comments__item--quote">
                                  <div className="comments__autor">
                                    <img
                                      className="comments__avatar"
                                      src="img/user.svg"
                                      alt=""
                                    />
                                    <span className="comments__name">
                                      John Doe
                                    </span>
                                    <span className="comments__time">
                                      11.08.2018, 11:11
                                    </span>
                                  </div>
                                  <p className="comments__text">
                                    <span>
                                      There are many variations of passages of
                                      Lorem Ipsum available, but the majority
                                      have suffered alteration in some form, by
                                      injected humour, or randomised words which
                                      don't look even slightly believable.
                                    </span>
                                    It has survived not only five centuries, but
                                    also the leap into electronic typesetting,
                                    remaining essentially unchanged. It was
                                    popularised in the 1960s with the release of
                                    Letraset sheets containing Lorem Ipsum
                                    passages, and more recently with desktop
                                    publishing software like Aldus PageMaker
                                    including versions of Lorem Ipsum.
                                  </p>
                                  <div className="comments__actions">
                                    <div className="comments__rate">
                                      <button type="button">
                                        <i className="icon ion-md-thumbs-up" />
                                        11
                                      </button>
                                      <button type="button">
                                        1
                                        <i className="icon ion-md-thumbs-down" />
                                      </button>
                                    </div>
                                    <button type="button">
                                      <i className="icon ion-ios-share-alt" />
                                      Reply
                                    </button>
                                    <button type="button">
                                      <i className="icon ion-ios-quote" />
                                      Quote
                                    </button>
                                  </div>
                                </li>
                                <li className="comments__item">
                                  <div className="comments__autor">
                                    <img
                                      className="comments__avatar"
                                      src="img/user.svg"
                                      alt=""
                                    />
                                    <span className="comments__name">
                                      John Doe
                                    </span>
                                    <span className="comments__time">
                                      07.08.2018, 14:33
                                    </span>
                                  </div>
                                  <p className="comments__text">
                                    There are many variations of passages of
                                    Lorem Ipsum available, but the majority have
                                    suffered alteration in some form, by
                                    injected humour, or randomised words which
                                    don't look even slightly believable. If you
                                    are going to use a passage of Lorem Ipsum,
                                    you need to be sure there isn't anything
                                    embarrassing hidden in the middle of text.
                                  </p>
                                  <div className="comments__actions">
                                    <div className="comments__rate">
                                      <button type="button">
                                        <i className="icon ion-md-thumbs-up" />
                                        99
                                      </button>
                                      <button type="button">
                                        35
                                        <i className="icon ion-md-thumbs-down" />
                                      </button>
                                    </div>
                                    <button type="button">
                                      <i className="icon ion-ios-share-alt" />
                                      Reply
                                    </button>
                                    <button type="button">
                                      <i className="icon ion-ios-quote" />
                                      Quote
                                    </button>
                                  </div>
                                </li>
                                <li className="comments__item">
                                  <div className="comments__autor">
                                    <img
                                      className="comments__avatar"
                                      src="img/user.svg"
                                      alt=""
                                    />
                                    <span className="comments__name">
                                      John Doe
                                    </span>
                                    <span className="comments__time">
                                      02.08.2018, 15:24
                                    </span>
                                  </div>
                                  <p className="comments__text">
                                    Many desktop publishing packages and web
                                    page editors now use Lorem Ipsum as their
                                    default model text, and a search for 'lorem
                                    ipsum' will uncover many web sites still in
                                    their infancy. Various versions have evolved
                                    over the years, sometimes by accident,
                                    sometimes on purpose (injected humour and
                                    the like).
                                  </p>
                                  <div className="comments__actions">
                                    <div className="comments__rate">
                                      <button type="button">
                                        <i className="icon ion-md-thumbs-up" />
                                        74
                                      </button>
                                      <button type="button">
                                        13
                                        <i className="icon ion-md-thumbs-down" />
                                      </button>
                                    </div>
                                    <button type="button">
                                      <i className="icon ion-ios-share-alt" />
                                      Reply
                                    </button>
                                    <button type="button">
                                      <i className="icon ion-ios-quote" />
                                      Quote
                                    </button>
                                  </div>
                                </li>
                              </ul>
                              <form action="#" className="form">
                                <textarea
                                  id="text"
                                  name="text"
                                  className="form__textarea"
                                  placeholder="Add comment"
                                  defaultValue={''}
                                />
                                <button type="button" className="form__btn">
                                  Send
                                </button>
                              </form>
                            </div>
                          </div>
                          {/* end comments */}
                        </div>
                      </div>
                      <div
                        className="tab-pane fade"
                        id="tab-2"
                        role="tabpanel"
                        aria-labelledby="2-tab"
                      >
                        <div className="row">
                          {/* reviews */}
                          <div className="col-12">
                            <div className="reviews">
                              <ul className="reviews__list">
                                <li className="reviews__item">
                                  <div className="reviews__autor">
                                    <img
                                      className="reviews__avatar"
                                      src="img/user.svg"
                                      alt=""
                                    />
                                    <span className="reviews__name">
                                      Best Marvel movie in my opinion
                                    </span>
                                    <span className="reviews__time">
                                      24.08.2018, 17:53 by John Doe
                                    </span>
                                    <span className="reviews__rating reviews__rating--green">
                                      8.4
                                    </span>
                                  </div>
                                  <p className="reviews__text">
                                    There are many variations of passages of
                                    Lorem Ipsum available, but the majority have
                                    suffered alteration in some form, by
                                    injected humour, or randomised words which
                                    don't look even slightly believable. If you
                                    are going to use a passage of Lorem Ipsum,
                                    you need to be sure there isn't anything
                                    embarrassing hidden in the middle of text.
                                  </p>
                                </li>
                                <li className="reviews__item">
                                  <div className="reviews__autor">
                                    <img
                                      className="reviews__avatar"
                                      src="img/user.svg"
                                      alt=""
                                    />
                                    <span className="reviews__name">
                                      Best Marvel movie in my opinion
                                    </span>
                                    <span className="reviews__time">
                                      24.08.2018, 17:53 by John Doe
                                    </span>
                                    <span className="reviews__rating reviews__rating--green">
                                      9.0
                                    </span>
                                  </div>
                                  <p className="reviews__text">
                                    There are many variations of passages of
                                    Lorem Ipsum available, but the majority have
                                    suffered alteration in some form, by
                                    injected humour, or randomised words which
                                    don't look even slightly believable. If you
                                    are going to use a passage of Lorem Ipsum,
                                    you need to be sure there isn't anything
                                    embarrassing hidden in the middle of text.
                                  </p>
                                </li>
                                <li className="reviews__item">
                                  <div className="reviews__autor">
                                    <img
                                      className="reviews__avatar"
                                      src="img/user.svg"
                                      alt=""
                                    />
                                    <span className="reviews__name">
                                      Best Marvel movie in my opinion
                                    </span>
                                    <span className="reviews__time">
                                      24.08.2018, 17:53 by John Doe
                                    </span>
                                    <span className="reviews__rating reviews__rating--red">
                                      5.5
                                    </span>
                                  </div>
                                  <p className="reviews__text">
                                    There are many variations of passages of
                                    Lorem Ipsum available, but the majority have
                                    suffered alteration in some form, by
                                    injected humour, or randomised words which
                                    don't look even slightly believable. If you
                                    are going to use a passage of Lorem Ipsum,
                                    you need to be sure there isn't anything
                                    embarrassing hidden in the middle of text.
                                  </p>
                                </li>
                              </ul>
                              <form action="#" className="form">
                                <input
                                  type="text"
                                  className="form__input"
                                  placeholder="Title"
                                />
                                <textarea
                                  className="form__textarea"
                                  placeholder="Review"
                                  defaultValue={''}
                                />
                                <div className="form__slider">
                                  <div
                                    className="form__slider-rating"
                                    id="slider__rating"
                                  />
                                  <div
                                    className="form__slider-value"
                                    id="form__slider-value"
                                  />
                                </div>
                                <button type="button" className="form__btn">
                                  Send
                                </button>
                              </form>
                            </div>
                          </div>
                          {/* end reviews */}
                        </div>
                      </div>
                      <div
                        className="tab-pane fade"
                        id="tab-3"
                        role="tabpanel"
                        aria-labelledby="3-tab"
                      >
                        {/* project gallery */}
                        <div className="gallery" itemScope>
                          <div className="row">
                            {/* gallery item */}
                            <figure
                              className="col-12 col-sm-6 col-xl-4"
                              itemProp="associatedMedia"
                              itemScope
                            >
                              <a
                                href="img/gallery/project-1.jpg"
                                itemProp="contentUrl"
                                data-size="1920x1280"
                              >
                                <img
                                  src="img/gallery/project-1.jpg"
                                  itemProp="thumbnail"
                                  alt="Image description"
                                />
                              </a>
                              <figcaption itemProp="caption description">
                                Some image caption 1
                              </figcaption>
                            </figure>
                            {/* end gallery item */}
                            {/* gallery item */}
                            <figure
                              className="col-12 col-sm-6 col-xl-4"
                              itemProp="associatedMedia"
                              itemScope
                            >
                              <a
                                href="img/gallery/project-2.jpg"
                                itemProp="contentUrl"
                                data-size="1920x1280"
                              >
                                <img
                                  src="img/gallery/project-2.jpg"
                                  itemProp="thumbnail"
                                  alt="Image description"
                                />
                              </a>
                              <figcaption itemProp="caption description">
                                Some image caption 2
                              </figcaption>
                            </figure>
                            {/* end gallery item */}
                            {/* gallery item */}
                            <figure
                              className="col-12 col-sm-6 col-xl-4"
                              itemProp="associatedMedia"
                              itemScope
                            >
                              <a
                                href="img/gallery/project-3.jpg"
                                itemProp="contentUrl"
                                data-size="1920x1280"
                              >
                                <img
                                  src="img/gallery/project-3.jpg"
                                  itemProp="thumbnail"
                                  alt="Image description"
                                />
                              </a>
                              <figcaption itemProp="caption description">
                                Some image caption 3
                              </figcaption>
                            </figure>
                            {/* end gallery item */}
                            {/* gallery item */}
                            <figure
                              className="col-12 col-sm-6 col-xl-4"
                              itemProp="associatedMedia"
                              itemScope
                            >
                              <a
                                href="img/gallery/project-4.jpg"
                                itemProp="contentUrl"
                                data-size="1920x1280"
                              >
                                <img
                                  src="img/gallery/project-4.jpg"
                                  itemProp="thumbnail"
                                  alt="Image description"
                                />
                              </a>
                              <figcaption itemProp="caption description">
                                Some image caption 4
                              </figcaption>
                            </figure>
                            {/* end gallery item */}
                            {/* gallery item */}
                            <figure
                              className="col-12 col-sm-6 col-xl-4"
                              itemProp="associatedMedia"
                              itemScope
                            >
                              <a
                                href="img/gallery/project-5.jpg"
                                itemProp="contentUrl"
                                data-size="1920x1280"
                              >
                                <img
                                  src="img/gallery/project-5.jpg"
                                  itemProp="thumbnail"
                                  alt="Image description"
                                />
                              </a>
                              <figcaption itemProp="caption description">
                                Some image caption 5
                              </figcaption>
                            </figure>
                            {/* end gallery item */}
                            {/* gallery item */}
                            <figure
                              className="col-12 col-sm-6 col-xl-4"
                              itemProp="associatedMedia"
                              itemScope
                            >
                              <a
                                href="img/gallery/project-6.jpg"
                                itemProp="contentUrl"
                                data-size="1920x1280"
                              >
                                <img
                                  src="img/gallery/project-6.jpg"
                                  itemProp="thumbnail"
                                  alt="Image description"
                                />
                              </a>
                              <figcaption itemProp="caption description">
                                Some image caption 6
                              </figcaption>
                            </figure>
                            {/* end gallery item */}
                          </div>
                        </div>
                        {/* end project gallery */}
                      </div>
                    </div>
                    {/* end content tabs */}
                  </div>

                  {/* sidebar */}
                  <div className="col-12 col-lg-4 col-xl-4">
                    <div className="row">
                      {/* section title */}
                      <div className="col-12">
                        <h2 className="section__title">You may also like...</h2>
                      </div>
                      {/* end section title */}
                      {/* card */}
                      <div className="col-6 col-sm-4 col-lg-6">
                        <div className="card">
                          <div className="card__cover">
                            <img src="img/covers/cover.jpg" alt="" />
                            <a href="#" className="card__play">
                              <i className="icon ion-ios-play" />
                            </a>
                            <span className="card__rate card__rate--green">
                              8.4
                            </span>
                          </div>
                          <div className="card__content">
                            <h3 className="card__title">
                              <a href="#">I Dream in Another Language</a>
                            </h3>
                            <span className="card__category">
                              <a href="#">Action</a>
                              <a href="#">Triler</a>
                            </span>
                          </div>
                        </div>
                      </div>
                      {/* end card */}
                      {/* card */}
                      <div className="col-6 col-sm-4 col-lg-6">
                        <div className="card">
                          <div className="card__cover">
                            <img src="img/covers/cover2.jpg" alt="" />
                            <a href="#" className="card__play">
                              <i className="icon ion-ios-play" />
                            </a>
                            <span className="card__rate card__rate--green">
                              7.1
                            </span>
                          </div>
                          <div className="card__content">
                            <h3 className="card__title">
                              <a href="#">Benched</a>
                            </h3>
                            <span className="card__category">
                              <a href="#">Comedy</a>
                            </span>
                          </div>
                        </div>
                      </div>
                      {/* end card */}
                      {/* card */}
                      <div className="col-6 col-sm-4 col-lg-6">
                        <div className="card">
                          <div className="card__cover">
                            <img src="img/covers/cover3.jpg" alt="" />
                            <a href="#" className="card__play">
                              <i className="icon ion-ios-play" />
                            </a>
                            <span className="card__rate card__rate--red">
                              6.3
                            </span>
                          </div>
                          <div className="card__content">
                            <h3 className="card__title">
                              <a href="#">Whitney</a>
                            </h3>
                            <span className="card__category">
                              <a href="#">Romance</a>
                              <a href="#">Drama</a>
                              <a href="#">Music</a>
                            </span>
                          </div>
                        </div>
                      </div>
                      {/* end card */}
                      {/* card */}
                      <div className="col-6 col-sm-4 col-lg-6">
                        <div className="card">
                          <div className="card__cover">
                            <img src="img/covers/cover4.jpg" alt="" />
                            <a href="#" className="card__play">
                              <i className="icon ion-ios-play" />
                            </a>
                            <span className="card__rate card__rate--green">
                              7.9
                            </span>
                          </div>
                          <div className="card__content">
                            <h3 className="card__title">
                              <a href="#">Blindspotting</a>
                            </h3>
                            <span className="card__category">
                              <a href="#">Comedy</a>
                              <a href="#">Drama</a>
                            </span>
                          </div>
                        </div>
                      </div>
                      {/* end card */}
                      {/* card */}
                      <div className="col-6 col-sm-4 col-lg-6">
                        <div className="card">
                          <div className="card__cover">
                            <img src="img/covers/cover5.jpg" alt="" />
                            <a href="#" className="card__play">
                              <i className="icon ion-ios-play" />
                            </a>
                            <span className="card__rate card__rate--green">
                              8.4
                            </span>
                          </div>
                          <div className="card__content">
                            <h3 className="card__title">
                              <a href="#">I Dream in Another Language</a>
                            </h3>
                            <span className="card__category">
                              <a href="#">Action</a>
                              <a href="#">Triler</a>
                            </span>
                          </div>
                        </div>
                      </div>
                      {/* end card */}
                      {/* card */}
                      <div className="col-6 col-sm-4 col-lg-6">
                        <div className="card">
                          <div className="card__cover">
                            <img src="img/covers/cover6.jpg" alt="" />
                            <a href="#" className="card__play">
                              <i className="icon ion-ios-play" />
                            </a>
                            <span className="card__rate card__rate--green">
                              7.1
                            </span>
                          </div>
                          <div className="card__content">
                            <h3 className="card__title">
                              <a href="#">Benched</a>
                            </h3>
                            <span className="card__category">
                              <a href="#">Comedy</a>
                            </span>
                          </div>
                        </div>
                      </div>
                      {/* end card */}
                    </div>
                  </div>
                  {/* end sidebar */}
                </div>
              </div>
            </section>
            {/* end content */}
          </div>
        </WrapMovieWatching>
      </WrapLayout>
    </ErrorBound>
  );
}
export default memo(MovieWatching);
