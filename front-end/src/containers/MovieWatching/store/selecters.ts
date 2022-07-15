/*
*
* MovieWatching selecters
* make by phamthainb
*/
import rootReducer from "redux/root-reducers";

export const selectMovieWatchingStore = ((state: ReturnType<typeof rootReducer>) => state.MovieWatching)