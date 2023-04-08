// /next.config.js
/** @type {import('next/dist/next-server/server/config-shared').NextConfig} */

const runtimeCaching = require("next-pwa/cache");
const withPWA = require('next-pwa')({
    dest: 'public'
})

const config = {
    reactStrictMode: true
};

module.exports = withPWA(config);