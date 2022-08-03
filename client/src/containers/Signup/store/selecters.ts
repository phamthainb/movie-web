/*
*
* Signup selecters
* make by phamthainb
*/
import rootReducer from "redux/root-reducers";

export const selectSignupStore = ((state: ReturnType<typeof rootReducer>) => state.Signup)