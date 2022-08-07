/*
 *
 * App actions
 *
 */
import { action } from 'typesafe-actions';
import * as types from './constants';
import { AppLanguage } from './types';

export const changeLanguage = (val: AppLanguage) => action(types.LANGUAGE, val);

export const changeLoading = (val: boolean) => action(types.LOADING, val);

export const changeUser = (val: any) => action(types.USER, val);
