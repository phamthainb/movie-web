/*
 *
 * MovieWatching reducers
 * make by phamthainb
 */
import { Reducer } from 'redux';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import * as types from './constants';
import { ActionsMovieWatching, StoreMovieWatching } from './types';

const initState: StoreMovieWatching = {
  data: undefined,
  comments: undefined,
  reloadComment: false,
};

const reducersMovieWatching: Reducer<
  StoreMovieWatching,
  ActionsMovieWatching
> = (state = initState, actions: ActionsMovieWatching) => {
  switch (actions.type) {
    case types.GET_BY_ID: {
      return { ...state, data: actions.payload };
    }

    case types.GET_COMMENT: {
      return { ...state, comments: actions.payload };
    }

    case types.RELOAD_COMMET: {
      return { ...state, reloadComment: !state.reloadComment };
    }
    default:
      return { ...state };
  }
};

export default reducersMovieWatching;
