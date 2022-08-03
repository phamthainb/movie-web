/*
*
* HelpPage reducers
* make by phamthainb
*/
import { Reducer } from 'redux';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import * as types from './constants';
import { ActionsHelpPage, StoreHelpPage } from "./types";

const initState : StoreHelpPage = { };

const reducersHelpPage : Reducer<StoreHelpPage, ActionsHelpPage> = (state = initState, actions: ActionsHelpPage) => {
switch (actions.type) {
default:
return { ...state };
}
};

export default reducersHelpPage;