/*
 *
 * App types
 *
 */
import { TypeAccount } from 'containers/MovieWatching/store/types';
import { ActionType } from 'typesafe-actions';
import * as actions from './actions';

export type AppStore = {
  loading: boolean;
  lang: AppLanguage;
  user: TypeAccount | undefined;
};

export type ActionsApp = ActionType<typeof actions>;

export type AppLanguage = 'vi' | 'en';
