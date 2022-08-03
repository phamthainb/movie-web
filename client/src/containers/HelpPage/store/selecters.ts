/*
*
* HelpPage selecters
* make by phamthainb
*/
import rootReducer from "redux/root-reducers";

export const selectHelpPageStore = ((state: ReturnType<typeof rootReducer>) => state.HelpPage)