import { createStore } from 'vuex'
import axios from 'axios'

axios.defaults.baseURL = 'http://localhost:9292/api/v1'
axios.defaults.headers.common["Authorization"] = `Bearer ${localStorage.getItem("token")}`;
axios.defaults.headers.common["Content-Type"] = "application/json";
const api = axios.create()

interface IQuote {
  author: string,
  quote: string
}

interface IUser {
  id: string,
  username: string
}

export type State = {
  quote: IQuote | null,
  user: IUser | null,
  authenticated: boolean,
  users: Array<IUser>,
  authenticationMessage: string
}
const state: State = { quote: null, user: null, authenticated: false, users: [], authenticationMessage: '' }

export default createStore({
  state,
  getters: {
    isAuthenticated: state => state.authenticated,
    quote: state => state.quote,
    user: state => state.user,
    users: state => state.users,
    authenticationMessage: state => state.authenticationMessage
  },
  mutations: {
    setQuote(state, quote) {
      state.quote = quote
    },
    authenticationSuccess(state, token) {
      console.log(' Authentication successful')
      state.authenticationMessage = ''
      localStorage.setItem('token', token)
      console.log(' Saving JWT token ' + token + ' to local storage')
      axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;  // Update axios default header

      state.authenticated = true
      console.log(" Key saved to localStorage: " + localStorage.getItem('token'));
    },
    authenticationFailure(state) {
      console.log(' Athentication failed')
      state.authenticationMessage = 'incorrect username or password'
      localStorage.removeItem('token')
      state.authenticated = false
    },
    authenticationRemoval(state) {
      console.log(' Authentication removed')
      state.authenticationMessage = ''
      localStorage.removeItem('token')
      state.authenticated = false
    },
    setUsers(state, users) {
      console.log(' Setting users', users)
      state.users = users
    }
  },
  actions: {
    async fetchQuote(context) {

      console.log("JWT token from axios headers:", axios.defaults.headers.common["Authorization"]);

      const response = await api.get('/qotd')
      context.commit('setQuote', response.data.quote)
    },
    async signIn(context, credentials) {
      console.log('Signing in with', credentials)
      try {
        const response = await api.post('/users/signin', credentials)
        context.commit('authenticationSuccess', response.data.token)
        console.log("JWT encoded: " + JSON.stringify(response.data.token))
      } catch {
        context.commit('authenticationFailure')
      }
    },
    async signOut(context) {
      console.log('Signing out')
      context.commit('authenticationRemoval')
    },
    async fetchUsers(context) {
      const response = await api.get('/users')
      console.log(response.data)
      context.commit('setUsers', response.data)
    }
  },
  modules: {
  }
})
