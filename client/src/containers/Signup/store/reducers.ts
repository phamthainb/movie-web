/*
*
* Signup reducers
* make by phamthainb
*/
import { Reducer } from 'redux';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import * as types from './constants';
import { ActionsSignup, StoreSignup } from "./types";

const initState : StoreSignup = { };

const reducersSignup : Reducer<StoreSignup, ActionsSignup> = (state = initState, actions: ActionsSignup) => {
switch (actions.type) {
default:
return { ...state };
}
};

export default reducersSignup;