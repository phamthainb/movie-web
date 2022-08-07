export const getPublic = (url: string) =>
  url ? `${process.env.REACT_APP_API}/${url}` : '/img/images.jpeg';

// clear object
function clean(obj: { [key: string]: any }) {
  for (var propName in obj) {
    if (
      obj[propName] === null ||
      obj[propName] === undefined ||
      obj[propName] === ''
    ) {
      delete obj[propName];
    }
  }
  return obj;
}

export const clearParams = (data: { [key: string]: any }) => clean(data);
