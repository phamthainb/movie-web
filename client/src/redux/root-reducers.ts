/**
 * This file export all of type the Reducers
 * File is export only type, not the logic
 * phamthainb
 */

import App from 'containers/App/store/reducers';
import Home from 'containers/Home/store/reducers';
import { combineReducers } from 'redux';
import MovieWatching from "containers/MovieWatching/store/reducers";
// [IMPORT NEW CONTAINERSTATE ABOVE] < Needed for generating containers seamlessly



//pages
const rootReducer = combineReducers({
  App,
  Home,
  MovieWatching,
  // [INSERT NEW REDUCER KEY ABOVE] < Needed for generating containers seamlessly

  });

export default rootReducer;