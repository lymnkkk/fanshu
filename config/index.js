const isProd = process.env.NODE_ENV === 'production'
const dev={
  // api:'http://localhost:80/api'
  api:'http://localhost:80/fanshu/api'
}

const prod={
	api:'http://lymnkkk.cn/api'
}
// const info=isProd ? prod : dev;
// const info=dev
const info=dev
console.log('api:'+info.api)
export default Object.assign(info,{
  links:{
    github:'https://github.com/lymnkkk',
    email:'843214245@qq.com'
  },
  titleTemplate:" | Lymn's Blog"
})