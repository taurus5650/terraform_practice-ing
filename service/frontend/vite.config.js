import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig(({ mode }) => {
  const backendHost = process.env.VITE_BACKEND_HOST || 'localhost:5002'

  const proxy = mode === 'development'
    ? {
        '/api': {
          target: `http://${backendHost}`,
          changeOrigin: true
        }
      }
    : undefined

  return {
    plugins: [vue()],
    server: {
      host: '0.0.0.0',
      port: 5173,
      proxy
    }
  }
})
