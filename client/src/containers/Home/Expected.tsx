import { request } from 'api/axios';
import API_URL from 'api/url';

import { useEffect, useState } from 'react';
import OwlCarousel from 'react-owl-carousel';
import { Link, useHistory } from 'react-router-dom';

export default function Expected() {
  const [data, setData] = useState([]);
  const history = useHistory();

  useEffect(() => {
    request({ method: 'get', url: API_URL.MOVIE.GET_BY_STATUS('new') }).then(
      res => {
        setData(res.data);
      },
    );
  }, []);

  return (
    <div>
      {/* section */}
      <section
        className="section section--bg"
        style={{ backgroundImage: 'url(img/section/section.jpg)' }}
      >
        <div className="container">
          <div className="row">
            {/* section title */}
            <div className="col-12">
              <div className="section__title-wrap">
                <h2 className="section__title section__title--carousel">
                  Expected premiere
                </h2>
                {/* <div className="section__nav-wrap">
                  <button
                    className="section__nav section__nav--prev"
                    type="button"
                    data-nav="#carousel1"
                  >
                    <i className="icon ion-ios-arrow-back" />
                  </button>
                  <button
                    className="section__nav section__nav--next"
                    type="button"
                    data-nav="#carousel1"
                  >
                    <i className="icon ion-ios-arrow-forward" />
                  </button>
                </div> */}
              </div>
            </div>
            {/* end section title */}
            {/* carousel */}
            <div className="col-12">
              {data.length > 0 ? (
                <OwlCarousel
                  className="owl-theme home__bg"
                  autoPlay
                  loop
                  items={5}
                  autoplayHoverPause
                  margin={30}
                  dots={false}
                >
                  {data.map((item: any, i: number) => (
                    <div className="card">
                      <div className="card__cover">
                        <img src="img/covers/cover.jpg" alt="" />
                        {/* <img src="img/covers/cover.jpg" alt="" /> */}

                        <Link
                          to={`/watch/${item?.id}`}
                          className="card__play"
                          onClick={e => {
                            // e.preventDefault();
                            // toast('This moive will comming sooon', {
                            //   icon: '👏',
                            // });
                          }}
                        >
                          <i className="icon ion-ios-play" />
                        </Link>
                        <span className="card__rate card__rate--green">
                          {item?.avgVote}
                        </span>
                      </div>
                      <div className="card__content">
                        <h3 className="card__title">
                          <a href="#">{item?.originalTitle}</a>
                        </h3>
                        <span className="card__category">
                          {item?.tag?.map((k: any, j: number) => (
                            <a key={j} href="#">
                              {k?.name}
                            </a>
                          ))}
                        </span>
                      </div>
                    </div>
                  ))}
                  {/* card */}
                  {/* end card */}
                </OwlCarousel>
              ) : (
                ''
              )}
            </div>
            {/* carousel */}
          </div>
        </div>
      </section>
      {/* end section */}
    </div>
  );
}
