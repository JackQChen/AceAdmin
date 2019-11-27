import Cookies from 'js-cookie'

const TokenKey = 'AuthToken'

export function getToken() {
  return Cookies.get(TokenKey)
}

export function setToken(token, expire) {
  return Cookies.set(TokenKey, token, { expires: expire })
}

export function removeToken() {
  return Cookies.remove(TokenKey)
}
