import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import FullReload from 'vite-plugin-full-reload'
import path from 'path'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(['config/routes.rb', 'app/views/**/*'])
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './app/assets')
    }
  }
})
