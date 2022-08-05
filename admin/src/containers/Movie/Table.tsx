import { Space, Table, Tag } from "antd";
import { useContext } from "react";
import { MovieContext } from "../../contexts/MovieContext";

// const data = [
//   {
//     key: "1",
//     name: "John Brown",
//     age: 32,
//     address: "New York No. 1 Lake Park",
//     tags: ["nice", "developer"],
//   },
//   {
//     key: "2",
//     name: "Jim Green",
//     age: 42,
//     address: "London No. 1 Lake Park",
//     tags: ["loser"],
//   },
//   {
//     key: "3",
//     name: "Joe Black",
//     age: 32,
//     address: "Sidney No. 1 Lake Park",
//     tags: ["cool", "teacher"],
//   },
// ];
// {
//     "id": 2,
//     "createdAt": "2022-08-02T15:54:08.745Z",
//     "updatedAt": "2022-08-02T15:54:08.745Z",
//     "deletedAt": null,

//     "imdb": "string",
//     "originalTitle": "string",
//     "year": 0,
//     "duration": 0,
//     "director": "string",
//     "writer": "string",
//     "productionCompany": "string",
//     "description": "string",
//     "avgVote": 0,
//     "votes": 0,
//     "url": null,
//     "image": null,

//     "tag": [
//       {
//         "id": 1,
//         "createdAt": "2022-08-02T15:53:19.878Z",
//         "updatedAt": "2022-08-02T15:53:19.878Z",
//         "deletedAt": null,
//         "name": "string"
//       }
//     ],
//     "actor": [
//       {
//         "id": 1,
//         "createdAt": "2022-08-02T15:53:19.889Z",
//         "updatedAt": "2022-08-02T15:53:19.889Z",
//         "deletedAt": null,
//         "name": "strin1g"
//       }
//     ]
//   }

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
    title: "originalTitle",
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
