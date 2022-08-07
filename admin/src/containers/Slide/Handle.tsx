import { Button, message, Modal } from "antd";
import { useContext, useEffect, useState } from "react";

import { Form, Select } from "antd";
import API_URL from "../../api/url";
import { TypeMovie } from "../../contexts/MovieContext";
import { SlideContext } from "../../contexts/SlideContext";
import { useRequest } from "../../hooks/useRequest";

const { Option } = Select;

const formItemLayout = {
  labelCol: {
    xs: {
      span: 24,
    },
    sm: {
      span: 8,
    },
  },
  wrapperCol: {
    xs: {
      span: 24,
    },
    sm: {
      span: 16,
    },
  },
};

const rule = [
  {
    required: true,
  },
];

const FormCreate = ({ setVisible, initialValues, callback }: any) => {
  const { requestInterToken } = useRequest();
  const { state, action } = useContext(SlideContext);
  const [form] = Form.useForm();
  const { request } = useRequest();

  const [tags, setTags] = useState([]);
  const [actors, setActors] = useState([]);

  const onFinish = (values: any) => {
    console.log(values);

    requestInterToken({
      method: "POST",
      url: API_URL.COLLECTION.CREAT,
      data: {
        type: "slide",
        movie: values.movie,
      },
    }).then((res) => {
      action.changeLoading(!state.loading);
      setVisible(false);
      message.success("Create success");
      callback();
    });
  };

  useEffect(() => {
    request({ method: "GET", url: API_URL.MOVIE.GET_ALL }).then((res) => {
      setTags(res.data);
    });
  }, []);

  return (
    <Form
      {...formItemLayout}
      form={form}
      name="Create"
      onFinish={onFinish}
      initialValues={initialValues}
      scrollToFirstError
    >
      <Form.Item name="movie" label="Movie" rules={rule}>
        <Select
          // mode=""
          placeholder="Please select"
          defaultValue={[]}
          onChange={(value) => {
            console.log(value);
          }}
          style={{ width: "100%" }}
        >
          {tags?.map((t: any, i) => (
            <Option key={t.id} value={t.id}>
              {t?.originalTitle}
            </Option>
          ))}
        </Select>
      </Form.Item>

      <Form.Item {...formItemLayout}>
        <Button type="primary" htmlType="submit">
          {initialValues?.id ? "Update Movie" : "Create Slide Item"}
        </Button>
      </Form.Item>
    </Form>
  );
};

const Handle = ({
  pick,
  open,
  callback,
}: {
  pick: TypeMovie | undefined;
  open: boolean;
  callback: any;
}) => {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    setVisible(open);
  }, [open]);

  return (
    <>
      <Button type="primary" onClick={() => setVisible(true)}>
        Create
      </Button>
      <Modal
        onOk={() => setVisible(false)}
        onCancel={() => setVisible(false)}
        width={1000}
        closable={true}
        title={pick ? "Update Movie" : "Create Slide Item"}
        visible={visible}
        footer={null}
      >
        <FormCreate
          setVisible={setVisible}
          initialValues={{}}
          callback={callback}
        />
      </Modal>
    </>
  );
};

export default Handle;
