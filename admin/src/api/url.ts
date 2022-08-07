const API_URL = {
  USER: {
    LOGIN: "/login",
    REGISTER: "/register",
    ACC: "/accounts",
  },
  COLLECTION: {
    GET_SLIDE: "/collection?type=slide",
    CREAT: "/collection",
    DEL: (id: number) => `/collection/${id}`,
    GET_PREMIERE: "/collection?type=premiere",
  },
  COMMENT: {
    GET: "/comment",
  },
  TAG: {
    GET: "/tag",
  },
  ACTOR: {
    GET: "/actor",
  },
  MOVIE: {
    GET_BY_TAG: (tagId: number) => `/movie/?tagId=${tagId}`,
    GET_BY_ID: (id: number) => `/movie/${id}`,
    GET_ALL: `/movie`,
    POST_MEDIA: (id: number) => `/movie/media/${id}`,
  },
};

export default API_URL;
