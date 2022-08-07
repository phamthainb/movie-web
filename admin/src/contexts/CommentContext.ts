import React from "react";
import { TypeAccount } from "./UserContext";

export interface TypeComment {
  id: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: any;
  status: boolean;
  content: string;
  account: TypeAccount;
}

export interface CommentContextType {
  state: { loading: boolean; data: TypeComment[]; search: any };
  action: {
    changeLoading: (val: boolean) => void;
    changeData: (data: any[]) => void;
    changeSearch: (search: any) => void;
  };
}

export const CommentContextDefault: CommentContextType = {
  state: { loading: false, data: [], search: {} },
  action: {
    changeLoading(val) {},
    changeData(data) {},
    changeSearch(search) {},
  },
};

export const CommentContext = React.createContext<CommentContextType>(
  CommentContextDefault
);
