import axios, { AxiosRequestConfig } from "axios";
import { useContext } from "react";
import { AppContext } from "../contexts";

const instanceAxios = {
  baseURL: process.env.REACT_APP_API,
};

const axiosConfig = axios.create(instanceAxios);

const axiosConfigInter = axios.create(instanceAxios);

export const useRequest = () => {
  const { action, state } = useContext(AppContext);

  const request = ({ method, url, data, ...rest }: AxiosRequestConfig) =>
    axiosConfig({
      method: method,
      url: url,
      data: data,
      ...rest,
    });

  const requestToken = ({ method, url, data, ...rest }: AxiosRequestConfig) => {
    let token = localStorage.getItem("token");

    return axiosConfig({
      method: method,
      url: url,
      data: data,
      headers: {
        Authorization: `Bearer ${token}`,
      },
      ...rest,
    });
  };

  // Add a request interceptor
  axiosConfigInter.interceptors.request.use(
    function (config) {
      // Do something before request is sent
      console.log("context 1", state);
      action.changeLoading(true);
      console.log("context 2", state);

      return config;
    },
    function (error) {
      // Do something with request error
      action.changeLoading(false);
      return Promise.reject(error);
    }
  );

  // Add a response interceptor
  axiosConfigInter.interceptors.response.use(
    function (response) {
      action.changeLoading(false);
      return response;
    },
    function (error) {
      action.changeLoading(false);
      return Promise.reject(error);
    }
  );

  const requestInter = ({ method, url, data, ...rest }: AxiosRequestConfig) =>
    axiosConfigInter({
      method: method,
      url: url,
      data: data,
      ...rest,
    });

  const requestInterToken = ({
    method,
    url,
    data,
    ...rest
  }: AxiosRequestConfig) => {
    let token = localStorage.getItem("token");

    return axiosConfigInter({
      method: method,
      url: url,
      data: data,
      headers: {
        Authorization: `Bearer ${token}`,
      },
      ...rest,
    });
  };

  return { request, requestToken, requestInter, requestInterToken };
};
