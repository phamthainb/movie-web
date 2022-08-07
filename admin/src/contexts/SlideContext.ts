import React from "react";
import { TypeMovie } from "./MovieContext";

export type TypeSlide = TypeMovie;

export interface SlideContextType {
  state: { loading: boolean; data: TypeSlide[]; search: any };
  action: {
    changeLoading: (val: boolean) => void;
    changeData: (data: any[]) => void;
    changeSearch: (search: any) => void;
  };
}

export const SlideContextDefault: SlideContextType = {
  state: { loading: false, data: [], search: {} },
  action: {
    changeLoading(val) {},
    changeData(data) {},
    changeSearch(search) {},
  },
};

export const SlideContext =
  React.createContext<SlideContextType>(SlideContextDefault);
