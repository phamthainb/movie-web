import { Button, Modal } from "antd";
import { useState } from "react";

import { Form, Input, Select } from "antd";

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
const FormCreate = () => {
  const [form] = Form.useForm();

  const onFinish = (values: any) => {
    console.log("Received values of form: ", values);
  };

  return (
    <Form
      {...formItemLayout}
      form={form}
      name="Create"
      onFinish={onFinish}
      initialValues={{}}
      scrollToFirstError
    >
      <Form.Item name="imdb" label="Score IMDB" rules={rule}>
        <Input type={"number"} max={10} min={0} />
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

      <Form.Item name="tag" label="Tags" rules={rule}>
        <Select
          mode="tags"
          placeholder="Please select"
          defaultValue={["male"]}
          onChange={(value) => {
            console.log(value);
          }}
          style={{ width: "100%" }}
        >
          <Option value="male">Male</Option>
          <Option value="female">Female</Option>
          <Option value="other">Other</Option>
        </Select>
      </Form.Item>

      <Form.Item name="actor" label="Actors" rules={rule}>
        <Select
          mode="tags"
          placeholder="Please select"
          defaultValue={["male"]}
          onChange={(value) => {
            console.log(value);
          }}
          style={{ width: "100%" }}
        >
          <Option value="male">Male</Option>
          <Option value="female">Female</Option>
          <Option value="other">Other</Option>
        </Select>
      </Form.Item>

      <Form.Item {...formItemLayout}>
        <Button type="primary" htmlType="submit">
          Create
        </Button>
      </Form.Item>
    </Form>
  );
};

const Handle = () => {
  const [visible, setVisible] = useState(false);

  const showModal = () => {
    setVisible(true);
  };

  const handleOk = () => {
    setVisible(false);
  };

  const handleCancel = () => {
    setVisible(false);
  };

  return (
    <>
      <Button type="primary" onClick={showModal}>
        Create
      </Button>
      <Modal
        onOk={handleOk}
        onCancel={handleCancel}
        width={1000}
        closable={true}
        title="Create Movie"
        visible={visible}
        footer={null}
      >
        <FormCreate />
      </Modal>
    </>
  );
};

export default Handle;