/**
 *
 * Loading
 *
 */
import { memo } from 'react';
import styled from 'styled-components';
import { ReactComponent as IconLoading } from './icon-loading.svg';

interface Props {
  active?: boolean;
}

function LoadingLazy() {
  return (
    <StylesLoading>
      <IconLoading />
    </StylesLoading>
  );
}
const StylesLoading = styled.div`
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgb(0 0 0 / 45%);
  align-items: center;
  display: flex;
`;

export default memo(LoadingLazy);
