/*
*
* MovieWatching types
* make by phamthainb
*/
import { ActionType } from 'typesafe-actions';
import * as actions from './actions';

export interface StoreMovieWatching {}

export type ActionsMovieWatching = ActionType<typeof actions>;