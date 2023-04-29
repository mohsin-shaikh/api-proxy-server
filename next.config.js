/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  async redirects() {
    return [
      {
        source: '/',
        destination: '/projects',
        permanent: false,
      },
    ]
  },
}

module.exports = nextConfig
