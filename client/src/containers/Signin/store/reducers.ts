/*
*
* Signin reducers
* make by phamthainb
*/
import { Reducer } from 'redux';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import * as types from './constants';
import { ActionsSignin, StoreSignin } from "./types";

const initState : StoreSignin = { };

const reducersSignin : Reducer<StoreSignin, ActionsSignin> = (state = initState, actions: ActionsSignin) => {
switch (actions.type) {
default:
return { ...state };
}
};

export default reducersSignin;