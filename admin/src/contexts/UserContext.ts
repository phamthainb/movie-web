import React from "react";

export interface TypeAccount {
  id: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: any;
  username: string;
  role: string;
  type: string;
}

export interface UserContextType {
  state: { loading: boolean; data: TypeAccount[]; search: any };
  action: {
    changeLoading: (val: boolean) => void;
    changeData: (data: any[]) => void;
    changeSearch: (search: any) => void;
  };
}

export const UserContextDefault: UserContextType = {
  state: { loading: false, data: [], search: {} },
  action: {
    changeLoading(val) {},
    changeData(data) {},
    changeSearch(search) {},
  },
};

export const UserContext =
  React.createContext<UserContextType>(UserContextDefault);
