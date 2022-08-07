import { Space, Table, Tag } from "antd";
import { useContext } from "react";
import { MovieContext } from "../../contexts/MovieContext";

const columns = [
  {
    title: "id",
    dataIndex: "id",
    key: "id",
  },
  {
    title: "imdb",
    dataIndex: "imdb",
    key: "imdb",
  },
  {
    title: "image",
    dataIndex: "image",
    key: "image",
    render: (_: any, { image }: any) => <>{image ? "done" : "none"}</>,
  },
  {
    title: "url",
    dataIndex: "url",
    key: "url",
    render: (_: any, { url }: any) => <>{url ? "done" : "none"}</>,
  },
  {
    title: "name",
    dataIndex: "originalTitle",
    key: "originalTitle",
  },
  {
    title: "tag",
    key: "tag",
    dataIndex: "tag",
    render: (_: any, { tag }: any) => (
      <>
        {tag.map((t: any) => {
          return <Tag>{t.name.toUpperCase()}</Tag>;
        })}
      </>
    ),
  },
  {
    title: "actor",
    key: "actor",
    dataIndex: "actor",
    render: (_: any, { actor }: any) => (
      <>
        {actor.map((c: any) => {
          return <Tag>{c.name.toLocaleUpperCase()}</Tag>;
        })}
      </>
    ),
  },
  {
    title: "Upload",
    key: "action",
    render: (_: any, record: any) => {
      console.log("record", record);

      return (
        <Space size="middle">
          <a>Image</a>
          <a>Video</a>
        </Space>
      );
    },
  },
];

const Tables = () => {
  const {
    state: { data },
  } = useContext(MovieContext);
  return <Table columns={columns} dataSource={data} />;
};

export default Tables;
