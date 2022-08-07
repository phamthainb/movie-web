/*
 *
 * SearchMovie types
 * make by phamthainb
 */
import { TypeMovie } from 'containers/MovieWatching/store/types';
import { ActionType } from 'typesafe-actions';
import * as actions from './actions';

export interface StoreSearchMovie {
  data: TypeMovie[] | undefined;
}

export type ActionsSearchMovie = ActionType<typeof actions>;
