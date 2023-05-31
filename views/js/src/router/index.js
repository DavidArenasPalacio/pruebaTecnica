import { createRouter, createWebHistory } from 'vue-router'
import CreateProceso from '../views/CreateProceso.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/views/CreateProceso',
      name: 'CreateProceso',
      component: CreateProceso
    },
  ]
})

export default router
