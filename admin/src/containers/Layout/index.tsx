import {
  DesktopOutlined,
  FileOutlined,
  PieChartOutlined,
  TeamOutlined,
  UserOutlined,
} from "@ant-design/icons";
import { Layout, Menu } from "antd";
import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
const { Header, Content, Footer, Sider } = Layout;

const MyLayout = ({ children }: React.PropsWithChildren) => {
  const [collapsed, setCollapsed] = useState(false);
  const nav = useNavigate();

  useEffect(() => {
    const t = localStorage.getItem("token");
    if (!t) {
      nav("/login");
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const items = [
    {
      key: "1",
      icon: <PieChartOutlined />,
      label: "Dash",
      onClick: () => nav("/"),
    },
    {
      key: "2",
      icon: <DesktopOutlined />,
      label: "Movie",
      onClick: () => nav("/movie"),
    },
    {
      key: "sub1",
      icon: <UserOutlined />,
      label: "Collection",
      children: [
        {
          key: "3",
          label: "Slide",
          onClick: () => nav("/slide"),
        },
      ],
    },
    {
      key: "sub2",
      icon: <TeamOutlined />,
      label: "User",
      onClick: () => nav("/user"),
    },
    {
      key: "9",
      icon: <FileOutlined />,
      label: "Comment",
      onClick: () => nav("/comment"),
    },
  ];

  return (
    <Layout
      style={{
        minHeight: "100vh",
      }}
    >
      <Sider
        collapsible
        collapsed={collapsed}
        onCollapse={(value) => setCollapsed(value)}
      >
        <div className="logo" style={{ color: "white", fontSize: 24 }}>
          Admin Movie Web
        </div>

        <Menu
          theme="dark"
          defaultSelectedKeys={["1"]}
          mode="inline"
          items={items}
        />
      </Sider>

      <Layout className="site-layout">
        <Header
          className="site-layout-background"
          style={{
            padding: 0,
          }}
        />
        <Content
          style={{
            margin: "0 16px",
          }}
        >
          {children}
        </Content>
        <Footer
          style={{
            textAlign: "center",
          }}
        >
          Created by CN05 🤪🤪
        </Footer>
      </Layout>
    </Layout>
  );
};

export default MyLayout;
