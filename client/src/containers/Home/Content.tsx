/* eslint-disable jsx-a11y/anchor-is-valid */
import { request } from 'api/axios';
import API_URL from 'api/url';
import TabWrap from 'components/Tab';
import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';

const TabItem = ({ tagId }: { tagId: string }) => {
  const [movies, setMovies] = useState([]);

  useEffect(() => {
    request({ method: 'GET', url: API_URL.MOVIE.GET_BY_TAG(+tagId) }).then(
      res => {
        setMovies(res.data.slice(0, 10));
      },
    );
  }, []);

  // get all movie by tagid
  return (
    <div className="tab-content">
      <div className="tab-pane fade show active">
        <div className="row">
          {/* card */}
          {movies.length > 0
            ? movies.map((item: any, i: number) => (
                <div className="col-6 col-sm-4 col-md-3 col-xl-2">
                  <div className="card">
                    <div className="card__cover">
                      <img src="img/covers/cover.jpg" alt="" />
                      {/* <img src="img/covers/cover.jpg" alt="" /> */}

                      <Link to={`/watch/${item?.id}`} className="card__play">
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
                </div>
              ))
            : ''}

          {/* end card */}
        </div>
      </div>
    </div>
  );
};

export default function Content() {
  const [tags, setTags] = useState([]);

  useEffect(() => {
    request({ method: 'GET', url: API_URL.TAG.GET }).then(res => {
      setTags(res.data);
    });
  }, []);

  const titles = tags.slice(0, 10).map((item: any, i) => item.name);
  const contents = tags
    .slice(0, 10)
    .map((item: any, i) => <TabItem tagId={item?.id} />);

  return (
    <div>
      {/* content */}
      <section className="content" style={{ minHeight: '500px' }}>
        <div className="container">
          <h2 className="content__title">Category</h2>
        </div>
        <TabWrap title={titles} content={contents} dash />
      </section>
    </div>
  );
}

// const TabItem2 = () => (
//   <div className="tab-content">
//     <div
//       className="tab-pane fade show active"
//       id="tab-1"
//       role="tabpanel"
//       aria-labelledby="1-tab"
//     >
//       <div className="row">
//         {/* card */}
//         <div className="col-6 col-sm-4 col-md-3 col-xl-2">
//           <div className="card">
//             <div className="card__cover">
//               <img src="img/covers/cover.jpg" alt="" />
//               <a href="#" className="card__play">
//                 <i className="icon ion-ios-play" />
//               </a>
//               <span className="card__rate card__rate--green">8.4</span>
//             </div>
//             <div className="card__content">
//               <h3 className="card__title">
//                 <a href="#">I Dream in Another Language</a>
//               </h3>
//               <span className="card__category">
//                 <a href="#">Action</a>
//                 <a href="#">Triler</a>
//               </span>
//             </div>
//           </div>
//         </div>
//         {/* end card */}
//       </div>
//     </div>
//   </div>
// );
