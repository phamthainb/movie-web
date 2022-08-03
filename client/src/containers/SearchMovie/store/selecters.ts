/*
*
* SearchMovie selecters
* make by phamthainb
*/
import rootReducer from "redux/root-reducers";

export const selectSearchMovieStore = ((state: ReturnType<typeof rootReducer>) => state.SearchMovie)