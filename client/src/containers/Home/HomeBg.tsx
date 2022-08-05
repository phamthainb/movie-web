import 'owl.carousel/dist/assets/owl.carousel.css';
import 'owl.carousel/dist/assets/owl.theme.default.css';
import OwlCarousel from 'react-owl-carousel';

import { request } from 'api/axios';
import API_URL from 'api/url';
import { getPublic } from 'helpers';
import { useEffect, useState } from 'react';
import { FaPlay } from 'react-icons/fa';
import { useHistory } from 'react-router-dom';

export default function HomeBg() {
  const [data, setData] = useState([]);
  const history = useHistory();

  useEffect(() => {
    request({ method: 'get', url: API_URL.COLLECTION.GET_SLIDE }).then(res => {
      setData(res.data);
    });
  }, []);

  return (
    <section className="home">
      {data.length > 0 ? (
        <OwlCarousel
          className="owl-theme home__bg"
          center
          autoPlay
          loop
          items={1}
          autoplayHoverPause
          height={500}
          autoplayTimeout={10}
          autoplaySpeed={10}
          margin={25}
        >
          {data.map((item: any, index) => (
            <div className="item home__cover" key={item?.id ?? index}>
              <img
                src={getPublic(item?.image)}
                alt="img"
                className="item_img"
              />
              <div className="item_content">
                <p>{item?.description}</p>
                <button
                  className="btn_play"
                  onClick={() => {
                    history.push(`/watch/${item?.id}`);
                  }}
                >
                  <FaPlay /> Play
                </button>
              </div>
            </div>
          ))}
        </OwlCarousel>
      ) : (
        ''
      )}
    </section>
  );
}
