import { getMenuTree } from '@/api/account'
import { constantRoutes } from '@/router'

const state = {
  routes: [],
  menus: []
}

const mutations = {
  SET_ROUTES: (state, routes) => {
    state.routes = constantRoutes.concat(routes)
  },
  SET_MENUS: (state, menus) => {
    state.menus = menus
  }
}

const actions = {
  getMenus({ commit }) {
    return new Promise(resolve => {
      getMenuTree(1).then(data => {
        commit('SET_MENUS', data)
        resolve(data)
      })
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
