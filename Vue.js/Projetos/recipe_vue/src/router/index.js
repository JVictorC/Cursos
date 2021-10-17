import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/Login.vue'

const routes = [
  {
    path: '/',
    name: 'Login',
    component: Login
  },
  {
    path: '/home',
    name: 'Home',
    component: () => import('../views/Home.vue'),
    children: [
      {
        path: '/comidas',
        name: 'Comidas',
        component: () => import('../views/Comidas.vue')
      },
      {
        path: '/bebidas',
        name: 'Bebidas',
        component: () => import('../views/Explorar.vue')
      },
      {
        path: '/explorar',
        name: 'Explorar',
        component: () => import('../views/Bebidas.vue')
      },
    ]
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
