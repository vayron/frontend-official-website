// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    app: {
        buildAssetsDir: '/offical-website/', // 打包后资源文件存放文件夹
        cdnURL: 'https://cdn.visionstory.cn/www/' // 打包后资源文件放到 cdn 上的地址
    },
    experimental: {
        writeEarlyHints: false,
    }
})
