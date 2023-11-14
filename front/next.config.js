/** @type {import('next').NextConfig} */

// ローカルでのCORS対策
// https://zenn.dev/yoshio25/articles/9a27d4c75e3a16
const rewrites = process.env.NODE_ENV === 'development' ? [
  {
    source: '/graphql',
    destination: 'http://0.0.0.0:8080/graphql',
  },
] : [];


const nextConfig = {
  async rewrites() {
    return rewrites;
  },
}

module.exports = nextConfig
