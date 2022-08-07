import { TypeMovie, TypeTag } from 'containers/MovieWatching/store/types';
import { getPublic } from 'helpers';
import { useSelector } from 'react-redux';
import { Link } from 'react-router-dom';
import { selectSearchMovieStore } from './store/selecters';

export default function Data() {
  const { data } = useSelector(selectSearchMovieStore);

  return (
    <div className="container">
      <div className="row">
        {/* card */}
        {data && data?.length > 0
          ? data.map((k: TypeMovie, i) => (
              <div key={k.id} className="col-6 col-sm-4 col-md-3 col-xl-2">
                <div className="card">
                  <div className="card__cover">
                    <img src={getPublic(k.image)} alt="" />
                    <Link to={`/watch/${k.id}`} className="card__play">
                      <i className="icon ion-ios-play" />
                    </Link>
                    <span className="card__rate card__rate--green">
                      {k.avgVote}
                    </span>
                  </div>
                  <div className="card__content">
                    <h3 className="card__title">
                      <a href="#">{k.originalTitle}</a>
                    </h3>
                    <span className="card__category">
                      {k?.tag?.map((t: TypeTag, j) => (
                        <a key={t.id} href="#">
                          {t.name}
                        </a>
                      ))}
                    </span>
                  </div>
                </div>
              </div>
            ))
          : ''}
      </div>
    </div>
  );
}
