import { requestInterToken } from 'api/axios';
import API_URL from 'api/url';
import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import io from 'socket.io-client';
import { reloadComment } from './store/actions';

import { selectMovieWatchingStore } from './store/selecters';

export default function CommentPost() {
  const [value, setValue] = useState('');
  const { data } = useSelector(selectMovieWatchingStore);
  const [socket, setSocket] = useState<any>();

  const [peopleTyping, setPeopleTyping] = useState<string>();
  const dispatch = useDispatch();

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

    socket.on('comment_reload', () => {
      dispatch(reloadComment());
    });
  }

  return (
    <div>
      {peopleTyping && (
        <p style={{ color: 'white' }}>{peopleTyping} is typing...</p>
      )}

      <form action="#" className="form">
        <textarea
          onChange={e => {
            socket.emit('comment_typing', {
              movieId: data?.id,
            });
            setValue(e.target.value);
          }}
          name="text"
          className="form__textarea"
          placeholder="Add comment"
          value={value}
        />
        <button
          onClick={async () => {
            await requestInterToken({
              method: 'POST',
              url: API_URL.COMMENT.POST,
              data: {
                content: value,
                movie: data?.id,
              },
            });

            socket.emit('comment_post', {
              movieId: data?.id,
            });

            dispatch(reloadComment());
          }}
          type="button"
          className="form__btn"
        >
          Send
        </button>
      </form>
    </div>
  );
}
