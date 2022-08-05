/*
 *
 * MovieWatching types
 * make by phamthainb
 */
import { ActionType } from 'typesafe-actions';
import * as actions from './actions';

export interface StoreMovieWatching {
  data: TypeMovie | undefined;
  reloadComment: boolean;
  comments: TypeComment[] | undefined;
}

export type ActionsMovieWatching = ActionType<typeof actions>;

export interface TypeAccount {
  id: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: any;
  username: string;
  role: string;
  type: string;
}

export interface TypeComment {
  id: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: any;
  status: boolean;
  content: string;
  account: TypeAccount;
}

export interface TypeTag {
  id: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: any;
  name: string;
}

export interface TypeActor {
  id: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: any;
  name: string;
}

export interface TypeMovie {
  id: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: any;
  imdb: string;
  originalTitle: string;
  year: number;
  duration: number;
  director: string;
  writer: string;
  productionCompany: string;
  description: string;
  avgVote: number;
  votes: number;
  url?: any;
  image?: any;
  tag: TypeTag[];
  actor: TypeActor[];
}
