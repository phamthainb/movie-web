import { createGlobalStyle } from 'styled-components';

export const GlobalStyle = createGlobalStyle`  
  body{
    padding : 0;
    margin : 0;

    .input-range__label{
      &.input-range__label--max, &.input-range__label--min{
      display: none;
    }
    }
    .react-dropdown-select{
      pointer-events: auto;
      box-sizing: border-box;
      font-family: inherit;
      line-height: inherit;
      overflow: visible;
      margin: 0;
      appearance: none;
      box-shadow: none;
      transition: 0.4s;
      height: 40px;
      border-radius: 6px;
      background-color: rgba(210,201,255,0.04);
      border: 1px solid transparent;
      font-size: 16px;
      color: #fff;
      letter-spacing: 0.4px;
      width: 240px;
    }
  }
`;
