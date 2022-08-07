import { Divider, Table } from "antd";
import { useContext } from "react";
import { UserContext } from "../../contexts/UserContext";
import { useRequest } from "../../hooks/useRequest";

const Tables = () => {
  const { requestInterToken } = useRequest();

  const columns = [
    {
      title: "id",
      dataIndex: "id",
      key: "id",
    },
    {
      title: "username",
      dataIndex: "username",
      key: "username",
    },
    {
      title: "role",
      dataIndex: "role",
      key: "role",
    },
    {
      title: "createdAt",
      dataIndex: "createdAt",
      key: "createdAt",
      render: (_: any, { createdAt }: any) => (
        <>{new Date(createdAt).toLocaleDateString()}</>
      ),
    },
  ];

  const {
    state: { data, loading },
    action: { changeLoading },
  } = useContext(UserContext);

  return (
    <>
      <Divider />

      {data.length > 0 ? (
        <Table columns={columns} dataSource={data} />
      ) : (
        "Not found any data"
      )}
    </>
  );
};

export default Tables;
