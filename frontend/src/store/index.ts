import {ref} from 'vue'

const authenticated = ref(localStorage.getItem('token') != null)

export default authenticated

