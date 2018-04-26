//声明全局配置
fis.require('smarty')(fis);
fis.set('namespace', 'home');
fis.set('project.ignore', ['node_modules/**', 'output/**', 'fis-conf.js', '*.bak', '*.psd']);

fis.match('/widget/**/*', {
    isMod: true
});

// 开发环境配置
fis.media('dev').match('*', {
    useHash: false,
    optimizer: null
});

// 生产环境
fis.media('prod').match('*', {
    url:'/static/${namespace}$0',
    release: 'web/${static}/${namespace}/$0' 
});
fis.media('prod').match('${namespace}-map.json', {
    release: '/config/fis/$0'
});
fis.media('prod').match('/{plugin,test,smarty.conf,domain.conf,**.php}', {
    release: false
});
fis.media('prod').match('::image', {
    useHash: true
});
fis.media('prod').match('*.{js,css,less}', {
    useHash: true
});
fis.media('prod').match('favicon.ico', {
    release: 'web/$0',
    useHash: false
});

// tpl配置
fis.media('prod').match('*.tpl', {
    preprocessor: fis.plugin('extlang'),
    postprocessor: fis.plugin('require-async'),
    optimizer: [
        fis.plugin('smarty-xss'),
        fis.plugin('html-compress')
    ],
    useMap: true,
    release: '/views/${namespace}/$0'
});
fis.media('prod').match('/page/**.tpl', {
    extras: {
        isPage: true
    }
});
fis.media('prod').match('/(widget/**.tpl)', {
    url: '${namespace}/$0',
});

// 静态资源配置
fis.media('prod').match('*.js', {
    optimizer: fis.plugin('uglify-js', {
        mangle: {
            expect: ['require', 'define', 'some string'] //不想被压的
        }
    }),
    parser: fis.plugin('jdists', {
        remove: "debug"
    })
});
fis.media('prod').match('*.css', {
    optimizer: fis.plugin('clean-css', {
        'keepBreaks': true 
    }),
    useSprite: true 
});
fis.media('prod').match('*.png', {
  optimizer: fis.plugin('png-compressor',{
  })
});

// 文件同名依赖
fis.media('prod').match('*.{tpl,js}', {
    useSameNameRequire: true
});
fis.media('prod').match('static/mod.js', {
    packOrder: -100
});
// 配置雪碧图
fis.media('prod').match('::package', {
    packager: fis.plugin('map'),
    spriter: fis.plugin('csssprites', {
        layout: 'matrix',
        margin: '15'
    })
});
