import { Divider } from "antd";
import { useEffect, useState } from "react";
import API_URL from "../../api/url";
import {
  CommentContext,
  CommentContextType,
  TypeComment,
} from "../../contexts/CommentContext";
import { clearParams } from "../../helpers";
import { useRequest } from "../../hooks/useRequest";
import MyLayout from "../Layout";
import Tables from "./Table";

export default function Comment() {
  // context
  const [loading, setLoading] = useState(false);
  const [data, setData] = useState<TypeComment[]>([]);
  const [search, setSearch] = useState({});

  const valuesContext: CommentContextType = {
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
      url: API_URL.COMMENT.GET,
      params: clearParams(search),
    }).then((res) => {
      setData(res.data);
    });
  }, [loading, search]);

  return (
    <MyLayout>
      <CommentContext.Provider value={valuesContext}>
        <Divider />
        {data.length > 0 ? <Tables /> : ""}
      </CommentContext.Provider>
    </MyLayout>
  );
}
