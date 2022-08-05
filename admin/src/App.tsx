import { useState } from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Loading from "./components/Loading";
import Dashboard from "./containers/Dashboard";
import Login from "./containers/Login";
import Movie from "./containers/Movie";
import { AppContext, AppContextType } from "./contexts";

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
          <Route path="/" element={<Dashboard />} />
          <Route path="movie" element={<Movie />} />
          <Route path="login" element={<Login />} />
          <Route path="*" element={"Not found any"} />
          {/* <Outlet /> */}
        </Routes>
      </BrowserRouter>
      <Loading active={loading} />
    </AppContext.Provider>
  );
};

export default App;
