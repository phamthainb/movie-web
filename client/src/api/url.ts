const API_URL = {
  USER: {
    LOGIN: '/login',
    REGISTER: '/register',
    Me: '/me',
  },
  COLLECTION: {
    GET_SLIDE: '/collection?type=slide',
    GET_PREMIERE: '/collection?type=premiere',
  },
  TAG: {
    GET: '/tag',
  },
  COMMENT: {
    POST: '/comment',
    GET_BY_MOVIE: (id: number) => `/comment?movie=${id}`,
  },
  MOVIE: {
    GET: `/movie`,
    GET_BY_TAG: (tagId: number) => `/movie/?tagId=${tagId}`,
    GET_BY_STATUS: (s: any) => `/movie/?status=${s}`,
    GET_BY_ID: (id: number) => `/movie/${id}`,
  },
};

export default API_URL;
