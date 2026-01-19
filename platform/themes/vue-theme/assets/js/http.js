// Silence is golden
import axios from 'axios'

const http = axios.create({
    baseURL: '/',
    headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json',
    },
})

// CSRF (nếu có POST)
const token = document.querySelector('meta[name="csrf-token"]')
if (token) {
    http.defaults.headers.common['X-CSRF-TOKEN'] =
        token.getAttribute('content')
}

export default http
