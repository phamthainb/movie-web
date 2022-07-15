/*
*
* MovieWatching reducers
* make by phamthainb
*/
import { Reducer } from 'redux';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import * as types from './constants';
import { ActionsMovieWatching, StoreMovieWatching } from "./types";

const initState : StoreMovieWatching = { };

const reducersMovieWatching : Reducer<StoreMovieWatching, ActionsMovieWatching> = (state = initState, actions: ActionsMovieWatching) => {
switch (actions.type) {
default:
return { ...state };
}
};

export default reducersMovieWatching;