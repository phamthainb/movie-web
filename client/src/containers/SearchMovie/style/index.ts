/*
 *
 * SearchMovie style css file
 * make by phamthainb
 */

import styled from 'styled-components';

const WrapSearchMovie = styled.div`
  padding-top: 100px;
  .filter__item {
    min-width: 150px;
    padding-bottom: 12px;

    .input_name {
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
      background-color: rgba(210, 201, 255, 0.04);
      border: 1px solid transparent;
      font-size: 16px;
      color: #fff;
      letter-spacing: 0.4px;
      padding: 0 8px;
      width: 240px;
    }

    .filter__item-label {
      font-size: 18px;
      padding-bottom: 12px;
      font-weight: 500;
      text-transform: uppercase;
    }

    span {
      ::before,
      ::after {
        display: none;
      }
    }
    .filter__item-btn {
      .react-dropdown-select-content {
        color: white;
        padding-left: 8px;
      }
      .react-dropdown-select-dropdown-handle {
        color: white;
      }
      .react-dropdown-select-item {
        color: black;
      }
      span {
        position: relative;
        width: unset;
        height: unset;
        display: block;
        margin-top: unset;
      }
    }
  }
`;

export default WrapSearchMovie;
