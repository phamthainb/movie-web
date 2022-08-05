import { useEffect, useState } from 'react';
import { useSelector } from 'react-redux';
import io from 'socket.io-client';
import CommentList from './CommentList';
import { selectMovieWatchingStore } from './store/selecters';
import Suggest from './Suggest';

export default function Discover() {
  const { data } = useSelector(selectMovieWatchingStore);
  const [socket, setSocket] = useState<any>();

  const [peopleTyping, setPeopleTyping] = useState<string>();

  useEffect(() => {
    if (data?.id) {
      const socket = io('http://localhost:2999', {
        query: { movieId: data?.id },
        extraHeaders: {
          authorization: `Bearer ${localStorage.getItem('token') ?? ''}`,
        },
      });

      setSocket(socket);

      socket.on('connect', () => {
        console.log('connected');
      });

      socket.on('disconnect', () => {
        console.log('disconnect');
      });

      return () => {
        socket.off('connect');
        socket.off('disconnect');
        socket.off('people_is_typing');
      };
    }
  }, [data?.id]);

  if (socket) {
    socket.on('people_is_typing', (val: any) => {
      setPeopleTyping(val.user);

      setTimeout(() => {
        setPeopleTyping('');
      }, 5000);
    });
  }

  return (
    <>
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
            <CommentList />

            {/* sidebar */}
            <Suggest />
            {/* end sidebar */}
          </div>
        </div>
      </section>
      {/* end content */}
    </>
  );
}
