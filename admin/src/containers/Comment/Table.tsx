import { Divider, Table } from "antd";
import { useContext } from "react";
import { CommentContext } from "../../contexts/CommentContext";
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
      title: "user",
      dataIndex: "username",
      key: "username",
      render: (_: any, { account }: any) => <>{account?.username}</>,
    },
    {
      title: "content",
      dataIndex: "content",
      key: "content",
    },
    {
      title: "status",
      dataIndex: "status",
      key: "status",
      render: (_: any, { status }: any) => <>{`${status}`}</>,
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
  } = useContext(CommentContext);

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
