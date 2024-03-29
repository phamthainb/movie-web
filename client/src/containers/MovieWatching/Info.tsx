import { getPublic } from 'helpers';
import ReactPlayer from 'react-player';
import { useSelector } from 'react-redux';
import { selectMovieWatchingStore } from './store/selecters';

export default function Info() {
  const { data } = useSelector(selectMovieWatchingStore);

  return (
    <>
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
              <h1 className="section__title">{data?.originalTitle}</h1>
            </div>
            {/* end title */}
            {/* content */}
            <div className="col-12 col-lg-6">
              <div className="card card--details">
                <div className="row">
                  {/* card cover */}
                  <div className="col-12 col-sm-5 col-lg-6 col-xl-5">
                    <div className="card__cover">
                      <img
                        src={getPublic(data?.image)}
                        alt={data?.originalTitle}
                      />
                      <span className="card__rate card__rate--green">
                        {data?.avgVote}
                      </span>
                    </div>
                  </div>
                  {/* end card cover */}
                  {/* card content */}
                  <div className="col-12 col-sm-7 col-lg-6 col-xl-7">
                    <div className="card__content">
                      <ul className="card__meta">
                        <li>
                          <span>Director:</span> {data?.director}
                        </li>
                        <li>
                          <span>Cast:</span>
                          {data?.actor?.map((c, i) => (
                            <>
                              <a href="#">{c.name}</a>
                            </>
                          ))}
                        </li>
                        <li>
                          <span>Genre:</span>{' '}
                          {data?.tag?.map((c, i) => (
                            <>
                              <a href="#">{c.name}</a>
                            </>
                          ))}
                        </li>
                        <li>
                          <span>Release year:</span> {data?.year}
                        </li>
                        <li>
                          <span>Running time:</span>
                          {data?.duration} min
                        </li>
                        <li>
                          <span>Production Company:</span>{' '}
                          <a href="#">{data?.productionCompany}</a>
                        </li>
                      </ul>
                      <div className="card__description">
                        Description: {data?.description}
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
              {data?.url ? (
                <ReactPlayer
                  url={getPublic(data?.url)}
                  config={{ file: { forceHLS: true } }}
                  controls
                />
              ) : (
                <h3 style={{ color: 'white', fontSize: 24 }}>
                  'This movie will comming soon'
                </h3>
              )}
            </div>
            {/* end player */}
          </div>
        </div>
        {/* end details content */}
      </section>
      {/* end details */}
    </>
  );
}

// <video
// controls
// playsInline
// poster="demo/View_From_A_Blue_Moon_Trailer-HD.jpg"
// id="player"
// >

// <source
//   src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-576p.mp4"
//   type="video/mp4"
// />
// <source
//   src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-720p.mp4"
//   type="video/mp4"
// />
// <source
//   src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-1080p.mp4"
//   type="video/mp4"
// />

// <track
//   kind="captions"
//   label="English"
//   srcLang="en"
//   src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-HD.en.vtt"
//   default
// />
// <track
//   kind="captions"
//   label="Français"
//   srcLang="fr"
//   src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-HD.fr.vtt"
// />

// <a
//   href="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-576p.mp4"
//   download
// >
//   Download
// </a>
// </video>
