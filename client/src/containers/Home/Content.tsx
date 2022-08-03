import TabWrap from 'components/Tab';

const TabItem1 = () => (
  <div className="tab-content">
    <div
      className="tab-pane fade show active"
      id="tab-1"
      role="tabpanel"
      aria-labelledby="1-tab"
    >
      <div className="row">
        {/* card */}
        <div className="col-6 col-sm-4 col-md-3 col-xl-2">
          <div className="card">
            <div className="card__cover">
              <img src="img/covers/cover.jpg" alt="" />
              <a href="#" className="card__play">
                <i className="icon ion-ios-play" />
              </a>
              <span className="card__rate card__rate--green">9</span>
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
      </div>
    </div>
  </div>
);

const TabItem2 = () => (
  <div className="tab-content">
    <div
      className="tab-pane fade show active"
      id="tab-1"
      role="tabpanel"
      aria-labelledby="1-tab"
    >
      <div className="row">
        {/* card */}
        <div className="col-6 col-sm-4 col-md-3 col-xl-2">
          <div className="card">
            <div className="card__cover">
              <img src="img/covers/cover.jpg" alt="" />
              <a href="#" className="card__play">
                <i className="icon ion-ios-play" />
              </a>
              <span className="card__rate card__rate--green">8.4</span>
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
      </div>
    </div>
  </div>
);
export default function Content() {
  return (
    <div>
      {/* content */}
      <section className="content">
        <div className="container">
          <h2 className="content__title">Category</h2>
        </div>
        <TabWrap
          title={['NEW RELEASES', 'MOVIES', 'TV SERIES', 'CARTOONS']}
          content={[<TabItem1 />, <TabItem2 />, <TabItem1 />, <TabItem2 />]}
          dash
        />
      </section>
    </div>
  );
}
