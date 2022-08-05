const API_URL = {
  USER: {
    LOGIN: "/login",
    REGISTER: "/register",
  },
  COLLECTION: {
    GET_SLIDE: "/collection?type=slide",
    GET_PREMIERE: "/collection?type=premiere",
  },
  TAG: {
    GET: "/tag",
  },
  MOVIE: {
    GET_BY_TAG: (tagId: number) => `/movie/?tagId=${tagId}`,
    GET_BY_ID: (id: number) => `/movie/${id}`,
    GET_ALL: `/movie`,
  },
};

export default API_URL;
