import React from "react";

export interface TypeTag {
  id: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: any;
  name: string;
}

export interface TypeActor {
  id: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: any;
  name: string;
}

export interface TypeMovie {
  id: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: any;
  imdb: string;
  originalTitle: string;
  year: number;
  duration: number;
  director: string;
  writer: string;
  productionCompany: string;
  description: string;
  avgVote: number;
  votes: number;
  url?: any;
  image?: any;
  tag: TypeTag[];
  actor: TypeActor[];
}

export interface MovieContextType {
  state: { loading: boolean; data: TypeMovie[]; search: any };
  action: {
    changeLoading: (val: boolean) => void;
    changeData: (data: TypeMovie[]) => void;
    changeSearch: (search: any) => void;
  };
}

export const MovieContextDefault: MovieContextType = {
  state: { loading: false, data: [], search: {} },
  action: {
    changeLoading(val) {},
    changeData(data) {},
    changeSearch(search) {},
  },
};

export const MovieContext =
  React.createContext<MovieContextType>(MovieContextDefault);
