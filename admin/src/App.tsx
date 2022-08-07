import { useState } from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Loading from "./components/Loading";
import { AppContext, AppContextType } from "./contexts";

// const Comment = React.lazy(() => import("./containers/Comment"));
// const Login = React.lazy(() => import("./containers/Login"));
// const Movie = React.lazy(() => import("./containers/Movie"));
// const Slide = React.lazy(() => import("./containers/Slide"));
// const User = React.lazy(() => import("./containers/User"));

import Comment from "./containers/Comment";
import Login from "./containers/Login";
import Movie from "./containers/Movie";
import Slide from "./containers/Slide";
import User from "./containers/User";

const App = () => {
  const [loading, setLoading] = useState(false);

  const valuesContext: AppContextType = {
    state: { loading: loading },
    action: {
      changeLoading: (val) => setLoading(val),
    },
  };

  return (
    <AppContext.Provider value={valuesContext}>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Movie />} />
          <Route path="login" element={<Login />} />
          <Route path="user" element={<User />} />
          <Route path="comment" element={<Comment />} />
          <Route path="Slide" element={<Slide />} />
          <Route path="*" element={"Not found any"} />
        </Routes>
      </BrowserRouter>
      <Loading active={loading} />
    </AppContext.Provider>
  );
};

export default App;
