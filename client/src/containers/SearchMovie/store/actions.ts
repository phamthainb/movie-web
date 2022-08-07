/*
 *
 * SearchMovie actions
 * make by phamthainb
 */
import { action } from 'typesafe-actions';
import * as types from './constants';

export const changeData = (val: any[]) => action(types.GET, val);
