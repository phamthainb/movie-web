import { Tab, TabList, TabPanel, Tabs } from 'react-tabs';
import 'react-tabs/style/react-tabs.css';
import styled from 'styled-components';

const Styles = styled.div`
  color: white;

  .dash_bottom {
    border-bottom: 1px solid rgba(210, 201, 255, 0.1);
  }

  .react-tabs__tab-list {
    display: flex;
    border-bottom: none;
    margin-bottom: 0;

    .react-tabs__tab {
      all: unset;
      font-family: 'Source Sans Pro', sans-serif;
      font-weight: 400;
      list-style: none;
      box-sizing: border-box;
      text-decoration: none;
      background-color: transparent;
      transition: 0.4s;
      transition-property: color, background-color, border-color, opacity;
      display: block;
      line-height: 50px;
      color: rgba(255, 255, 255, 0.7);
      position: relative;
      text-transform: uppercase;
      font-size: 14px;
      letter-spacing: 0.4px;
      max-width: 100px;

      margin-right: 45px;
      padding: 12px 0 0 0;

      cursor: pointer;
    }

    .react-tabs__tab--selected {
      color: #ffd80e;
      border-bottom: 2px solid #ffd80e;

      &::before,
      &::after {
        all: unset;
      }
    }
  }

  .react-tabs__tab-panel {
    padding-top: 54px;
  }
  .react-tabs__tab-panel--selected {
  }
`;

export default function TabWrap({
  title,
  content,
  dash,
}: {
  title: string[];
  content: any[];
  dash?: boolean;
}) {
  return (
    <Styles>
      <Tabs>
        <div className={`${dash && 'dash_bottom'}`}>
          <div className={`container`}>
            <TabList>
              {title.map((k, i) => (
                <Tab key={i}>{k}</Tab>
              ))}
            </TabList>
          </div>
        </div>

        <div className="container">
          {content.map((k, i) => (
            <TabPanel key={i}>{k}</TabPanel>
          ))}
        </div>
      </Tabs>
    </Styles>
  );
}
