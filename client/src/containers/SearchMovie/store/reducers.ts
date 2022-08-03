/*
*
* SearchMovie reducers
* make by phamthainb
*/
import { Reducer } from 'redux';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import * as types from './constants';
import { ActionsSearchMovie, StoreSearchMovie } from "./types";

const initState : StoreSearchMovie = { };

const reducersSearchMovie : Reducer<StoreSearchMovie, ActionsSearchMovie> = (state = initState, actions: ActionsSearchMovie) => {
switch (actions.type) {
default:
return { ...state };
}
};

export default reducersSearchMovie;