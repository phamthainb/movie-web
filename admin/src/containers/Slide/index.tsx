import { Divider } from "antd";
import { useEffect, useState } from "react";
import API_URL from "../../api/url";
import { TypeMovie } from "../../contexts/MovieContext";
import { SlideContext, SlideContextType } from "../../contexts/SlideContext";
import { clearParams } from "../../helpers";
import { useRequest } from "../../hooks/useRequest";
import MyLayout from "../Layout";
import Tables from "./Table";

export default function Slide() {
  // context
  const [loading, setLoading] = useState(false);
  const [data, setData] = useState<TypeMovie[]>([]);
  const [search, setSearch] = useState({});

  const valuesContext: SlideContextType = {
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
      url: API_URL.COLLECTION.GET_SLIDE,
      params: clearParams(search),
    }).then((res) => {
      setData(res.data);
    });
  }, [loading, search]);

  return (
    <MyLayout>
      <SlideContext.Provider value={valuesContext}>
        <Divider />
        {data.length > 0 ? <Tables /> : ""}
      </SlideContext.Provider>
    </MyLayout>
  );
}
