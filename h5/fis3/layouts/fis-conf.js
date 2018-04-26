// 全局声明模块
fis.require('smarty')(fis);
fis.set('namespace', 'layouts');

// 开发模式
fis.media('dev').match('*', {
    useHash: false,
    optimizer: null
});

// 生产环境
fis.media('prod').match('${namespace}-map.json', {
    release: '/config/fis/$0'
});
// 不进行编译的
fis.media('prod').match('/{plugin,test,smarty.conf,domain.conf,**.php}', {
    release: false
});

fis.media('prod').match('main.php', {
	useHash: false,
    optimizer: null,
    release: '/views/${namespace}/$0'
});

fis.config.merge({
    settings : {
        postprocessor : {
            jswrapper : {
                type : 'amd',
                wrapAll : true
            }
        }
    }
});