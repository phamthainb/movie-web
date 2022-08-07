import { Divider, message, Modal, Space, Table } from "antd";
import { useContext, useState } from "react";
import API_URL from "../../api/url";
import { TypeMovie } from "../../contexts/MovieContext";
import { SlideContext } from "../../contexts/SlideContext";
import { useRequest } from "../../hooks/useRequest";
import Handle from "./Handle";

const Tables = () => {
  const { requestInterToken } = useRequest();

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
      render: (_: any, { url, status }: any) => (
        <>{url ? "done" : status === "uploading" ? "uploading" : "none"}</>
      ),
    },
    {
      title: "name",
      dataIndex: "originalTitle",
      key: "originalTitle",
    },
    {
      title: "Action",
      key: "action1",
      render: (_: any, record: any) => {
        return (
          <Space size="middle">
            <button
              onClick={() => {
                requestInterToken({
                  method: "delete",
                  url: API_URL.COLLECTION.DEL(+record?.collectionId),
                }).then(() => {
                  changeLoading(!loading);
                  message.success("Remove success");
                  setPick(undefined);
                });
              }}
            >
              Remove
            </button>
          </Space>
        );
      },
    },
  ];

  const {
    state: { data, loading },
    action: { changeLoading },
  } = useContext(SlideContext);

  const [pick, setPick] = useState<TypeMovie>();
  const [visibleImg, setVisibleImg] = useState(false);
  const [visibleVideo, setVisibleVideo] = useState(false);
  const [visibleUpdate, setVisibleUpdate] = useState(false);

  return (
    <>
      <Handle
        pick={pick}
        open={visibleUpdate}
        callback={() => {
          setPick(undefined);
          setVisibleUpdate(false);
        }}
      />
      <Divider />

      {data.length > 0 ? (
        <Table columns={columns} dataSource={data} />
      ) : (
        "Not found any data"
      )}

      <Modal
        onOk={() => {
          setVisibleImg(false);
        }}
        onCancel={() => {
          setVisibleImg(false);
        }}
        width={1000}
        closable={true}
        title="Upload Image"
        visible={visibleImg}
        footer={null}
      >
        <input
          type="file"
          onChange={(e) => {
            // console.log(e.target.files);
            if (pick && e.target.files) {
              const d = new FormData();
              d.append("img", e.target.files[0]);

              requestInterToken({
                method: "POST",
                url: API_URL.MOVIE.POST_MEDIA(+pick?.id),
                data: d,
              }).then((res) => {
                changeLoading(!loading);
                setVisibleImg(false);
                message.success("Success");
                setPick(undefined);
              });
            }
          }}
        />
      </Modal>

      <Modal
        onOk={() => {
          setVisibleVideo(false);
        }}
        onCancel={() => {
          setVisibleVideo(false);
        }}
        width={1000}
        closable={true}
        title="Upload Image"
        visible={visibleVideo}
        footer={null}
      >
        <input
          type="file"
          onChange={(e) => {
            // console.log(e.target.files);
            if (pick && e.target.files) {
              const d = new FormData();
              d.append("video", e.target.files[0]);

              requestInterToken({
                method: "POST",
                url: API_URL.MOVIE.POST_MEDIA(+pick?.id),
                data: d,
              }).then((res) => {
                changeLoading(!loading);
                setVisibleVideo(false);
                message.success("Success");
                setPick(undefined);
              });
            }
          }}
        />
      </Modal>
    </>
  );
};

export default Tables;
