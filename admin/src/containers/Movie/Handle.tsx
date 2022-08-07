import { Button, message, Modal } from "antd";
import { useContext, useEffect, useState } from "react";

import { Form, Input, Select } from "antd";
import API_URL from "../../api/url";
import {
  MovieContext,
  TypeActor,
  TypeMovie,
  TypeTag,
} from "../../contexts/MovieContext";
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
// {
//     "imdb": "string",
//     "originalTitle": "string",
//     "year": 0,
//     "duration": 0,
//     "director": "string",
//     "writer": "string",
//     "productionCompany": "string",
//     "actors": [
//       "string"
//     ],
//     "description": "string",
//     "tags": [
//       "string"
//     ]
//   }

const rule = [
  {
    required: true,
  },
];

const FormCreate = ({ setVisible, initialValues, callback }: any) => {
  const { requestInterToken } = useRequest();
  const { state, action } = useContext(MovieContext);
  const [form] = Form.useForm();
  const { request } = useRequest();

  const [tags, setTags] = useState([]);
  const [actors, setActors] = useState([]);

  const onFinish = (values: any) => {
    console.log("Received values of form: ", values);
    if (initialValues?.id) {
      requestInterToken({
        method: "PATCH",
        url: API_URL.MOVIE.GET_BY_ID(initialValues?.id),
        data: {
          ...values,
          year: +values?.year,
          duration: +values?.duration,
        },
      }).then((res) => {
        action.changeLoading(!state.loading);
        setVisible(false);
        message.success("Update success");
        callback();
      });
    } else {
      requestInterToken({
        method: "POST",
        url: API_URL.MOVIE.GET_ALL,
        data: {
          ...values,
          year: +values?.year,
          duration: +values?.duration,
        },
      }).then((res) => {
        action.changeLoading(!state.loading);
        setVisible(false);
        message.success("Create success");
        callback();
      });
    }
  };

  useEffect(() => {
    request({ method: "GET", url: API_URL.TAG.GET }).then((res) => {
      setTags(res.data);
    });
    request({ method: "GET", url: API_URL.ACTOR.GET }).then((res) => {
      setActors(res.data);
    });
  }, []);

  console.log("initialValues", initialValues);

  return (
    <Form
      {...formItemLayout}
      form={form}
      name="Create"
      onFinish={onFinish}
      initialValues={initialValues}
      scrollToFirstError
    >
      <Form.Item name="imdb" label="IMDB" rules={rule}>
        <Input type={"text"} />
      </Form.Item>

      <Form.Item name="year" label="Year Realese" rules={rule}>
        <Input type={"number"} max={2100} min={1500} />
      </Form.Item>

      <Form.Item name="duration" label="Time Duration" rules={rule}>
        <Input type={"number"} min={0} />
      </Form.Item>

      <Form.Item name="originalTitle" label="Original Title" rules={rule}>
        <Input />
      </Form.Item>

      <Form.Item name="director" label="Director" rules={rule}>
        <Input />
      </Form.Item>

      <Form.Item name="writer" label="Writer" rules={rule}>
        <Input />
      </Form.Item>

      <Form.Item
        name="productionCompany"
        label="Production Company"
        rules={rule}
      >
        <Input.TextArea showCount />
      </Form.Item>

      <Form.Item name="description" label="Description" rules={rule}>
        <Input.TextArea showCount />
      </Form.Item>

      <Form.Item name="tags" label="Tags" rules={rule}>
        <Select
          mode="tags"
          placeholder="Please select"
          defaultValue={[]}
          onChange={(value) => {
            console.log(value);
          }}
          style={{ width: "100%" }}
        >
          {tags?.map((t: TypeTag, i) => (
            <Option key={t.id} value={t.name}>
              {t.name}
            </Option>
          ))}
        </Select>
      </Form.Item>

      <Form.Item name="actors" label="Actors" rules={rule}>
        <Select
          mode="tags"
          placeholder="Please select"
          defaultValue={[]}
          onChange={(value) => {
            console.log(value);
          }}
          style={{ width: "100%" }}
        >
          {actors?.map((t: TypeActor, i) => (
            <Option key={t.id} value={t.name}>
              {t.name}
            </Option>
          ))}
        </Select>
      </Form.Item>

      <Form.Item {...formItemLayout}>
        <Button type="primary" htmlType="submit">
          {initialValues?.id ? "Update Movie" : "Create Movie"}
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
        title={pick ? "Update Movie" : "Create Movie"}
        visible={visible}
        footer={null}
      >
        <FormCreate
          setVisible={setVisible}
          initialValues={{
            id: pick?.id,
            imdb: pick?.imdb,
            year: pick?.year,
            duration: pick?.duration,
            originalTitle: pick?.originalTitle,
            director: pick?.director,
            writer: pick?.writer,
            productionCompany: pick?.productionCompany,
            description: pick?.description,
            tags: pick?.tag.map((k) => k.name),
            actors: pick?.actor?.map((k) => k.name),
          }}
          callback={callback}
        />
      </Modal>
    </>
  );
};

export default Handle;
