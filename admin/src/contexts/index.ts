import React from "react";

export interface AppContextType {
  state: { loading: boolean };
  action: { changeLoading: (val: boolean) => void };
}

export const AppContextDefault: AppContextType = {
  state: { loading: false },
  action: { changeLoading(val) {} },
};

export const AppContext =
  React.createContext<AppContextType>(AppContextDefault);
