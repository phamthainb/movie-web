import { Divider } from "antd";
import { useEffect, useState } from "react";
import API_URL from "../../api/url";
import {
  TypeAccount,
  UserContext,
  UserContextType,
} from "../../contexts/UserContext";
import { clearParams } from "../../helpers";
import { useRequest } from "../../hooks/useRequest";
import MyLayout from "../Layout";
import Search from "./Search";
import Tables from "./Table";

export default function User() {
  // context
  const [loading, setLoading] = useState(false);
  const [data, setData] = useState<TypeAccount[]>([]);
  const [search, setSearch] = useState({});

  const valuesContext: UserContextType = {
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
      url: API_URL.USER.ACC,
      params: clearParams(search),
    }).then((res) => {
      setData(res.data);
    });
  }, [loading, search]);

  return (
    <MyLayout>
      <UserContext.Provider value={valuesContext}>
        <Search />
        <Divider />
        {data.length > 0 ? <Tables /> : ""}
      </UserContext.Provider>
    </MyLayout>
  );
}
