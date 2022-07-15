import OwlCarousel from 'react-owl-carousel';

export default function Expected() {
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
              <OwlCarousel
                className="owl-theme home__bg"
                autoPlay
                loop
                items={5}
                autoplayHoverPause
                margin={30}
              >
                {/* card */}
                <div className="card">
                  <div className="card__cover">
                    <img src="img/covers/cover6.jpg" alt="" />
                    <a href="#" className="card__play">
                      <i className="icon ion-ios-play" />
                    </a>
                    <span className="card__rate card__rate--green">7.1</span>
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
                {/* end card */}
                {/* card */}
                <div className="card">
                  <div className="card__cover">
                    <img src="img/covers/cover6.jpg" alt="" />
                    <a href="#" className="card__play">
                      <i className="icon ion-ios-play" />
                    </a>
                    <span className="card__rate card__rate--green">7.1</span>
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
                {/* end card */}
              </OwlCarousel>
            </div>
            {/* carousel */}
          </div>
        </div>
      </section>
      {/* end section */}
    </div>
  );
}
