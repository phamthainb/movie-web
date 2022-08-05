export const getPublic = (url: string) =>
  url ? `${process.env.REACT_APP_API}/${url}` : '/img/images.jpeg';
