import { Divider } from "antd";
import { useEffect, useState } from "react";
import API_URL from "../../api/url";
import {
  MovieContext,
  MovieContextType,
  TypeMovie,
} from "../../contexts/MovieContext";
import { clearParams } from "../../helpers";
import { useRequest } from "../../hooks/useRequest";
import MyLayout from "../Layout";
import Search from "./Search";
import Tables from "./Table";

export default function Movie() {
  // context
  const [loading, setLoading] = useState(false);
  const [data, setData] = useState<TypeMovie[]>([]);
  const [search, setSearch] = useState({});

  const valuesContext: MovieContextType = {
    state: { loading: loading, data: data, search: search },
    action: {
      changeLoading: (val) => setLoading(val),
      changeData(data) {
        setData(data);
      },
      changeSearch(search) {
        setSearch(search);
      },
    },
  };
  // call api
  const { requestToken } = useRequest();

  useEffect(() => {
    requestToken({
      method: "get",
      url: API_URL.MOVIE.GET_ALL,
      params: clearParams(search),
    }).then((res) => {
      setData(res.data);
    });
  }, [loading, search]);

  // console.log("data", data);

  return (
    <MyLayout>
      <MovieContext.Provider value={valuesContext}>
        <Search />
        <Divider />
        {data.length > 0 ? <Tables /> : ""}
      </MovieContext.Provider>
    </MyLayout>
  );
}
