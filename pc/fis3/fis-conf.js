// 项目初始化配置
fis.match('*.{js,css}', {
  useHash: true
});

fis.match('::image', {
  useHash: true
});

fis.match('*.js', {
  optimizer: fis.plugin('uglify-js')
});

fis.match('*.css', {
  optimizer: fis.plugin('clean-css')
});

fis.match('*.png', {
  optimizer: fis.plugin('png-compressor')
});

// 定义开发模式下配置
fis.media('dev')
  .match('*', {
    useHash: false,
    optimizer: null
  });

// 定义生产模式下配置
fis.media('production');