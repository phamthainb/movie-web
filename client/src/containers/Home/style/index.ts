/*
 *
 * MovieWatching style css file
 * make by phamthainb
 */

import styled from 'styled-components';

const WrapHome = styled.div`
  .home__bg {
    .home__cover {
      position: relative;
      opacity: 1;
      .item_img {
        opacity: 0.3;
      }
      .item_content {
        position: absolute;
        top: 50%;
        left: 24px;
        z-index: 2;

        p {
          color: #fff;
          font-size: 1.2vw;
          font-weight: 400;
          line-height: normal;
          text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.45);
          letter-spacing: 0 !important;
          max-width: 60%;
        }

        button.btn_play {
          font-size: 20px !important;
          letter-spacing: 0 !important;
          font: inherit;
          margin: 0;
          overflow: visible;
          text-transform: none;
          align-items: center;
          appearance: none;
          border: 0px;
          border-radius: 4px;
          cursor: pointer;
          display: flex;
          justify-content: space-around;
          opacity: 1;
          padding: 0.8rem;
          position: relative;
          user-select: none;
          will-change: background-color, color;
          word-break: break-word;
          white-space: nowrap;
          margin-bottom: 1rem;
          margin-right: 1rem;
          background-color: white;
          color: black;
          margin-left: 0;
          padding-left: 2rem;
          padding-right: 2.4rem;

          svg {
            margin-right: 12px;
          }

          &:hover {
            opacity: 0.8;
          }
        }
      }
    }

    .owl-dots {
      margin-top: -100px !important;
    }
  }
`;

export default WrapHome;
