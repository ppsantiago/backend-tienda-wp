

export const randmonPort = () => {
  let port = Math.round(Math.random()*(18000 - 10000));
  return port;
}
