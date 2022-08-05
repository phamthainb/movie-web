/*
 *
 * MovieWatching actions
 * make by phamthainb
 */
import { action } from 'typesafe-actions';
import * as types from './constants';

export const get = (data: any) => action(types.GET_BY_ID, data);

export const getComment = (data: any) => action(types.GET_COMMENT, data);

export const reloadComment = () => action(types.RELOAD_COMMET);
