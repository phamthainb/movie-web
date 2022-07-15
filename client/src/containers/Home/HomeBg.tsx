import 'owl.carousel/dist/assets/owl.carousel.css';
import 'owl.carousel/dist/assets/owl.theme.default.css';
import OwlCarousel from 'react-owl-carousel';

export default function HomeBg() {
  return (
    <section className="home">
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
        <div className="item home__cover" data-bg="img/home/home__bg.jpg">
          <img src="img/home/home__bg.jpg" alt="img" />
        </div>
        <div className="item home__cover" data-bg="img/home/home__bg2.jpg">
          <img src="img/home/home__bg2.jpg" alt="img" />
        </div>
        <div className="item home__cover" data-bg="img/home/home__bg3.jpg">
          <img src="img/home/home__bg3.jpg" alt="img" />
        </div>
        <div className="item home__cover" data-bg="img/home/home__bg4.jpg">
          <img src="img/home/home__bg4.jpg" alt="img" />
        </div>
        <div className="item home__cover" data-bg="img/home/home__bg5.jpg">
          <img src="img/home/home__bg5.jpg" alt="img" />
        </div>
      </OwlCarousel>
    </section>
  );
}
