//当前文件所在目录不能忘记在pubspec.yaml中声明
//用户自定义拓展，需要在fair_basic_config.json中注册
//fair_basic_config.json文件所在目录不能忘记在pubspec.yaml中声明
//会在基础js加载之后加载
let FairBasicPluginCallBack = {};
let FairBasicPluginCallBackId = 0;
//变量名需要与flutter中的plugin类名保持一致
let XhBasicPlugin = function() {
    return {
            mFairPluginId: 0,
            call: function (params) {
                console.log('----------------------------');
                let respMap = {};
                respMap = mapOrSetToObject(params);
                var id = 'FairBasicPlugin$' + (++FairBasicPluginCallBackId);
                let paramsMap = {};
                FairBasicPluginCallBack[id] = respMap['args']['response'];
                paramsMap['className'] = "XhBasicPlugin#call";
                paramsMap['funcName'] = 'invokePlugin';
                paramsMap['pageName'] = respMap['pageName'];
                paramsMap['id'] = id;
                paramsMap['args'] = respMap['args'];
                let map = JSON.stringify(paramsMap);
                console.log('XhBasicPlugin 请求参数：' + map);
                invokeFlutterCommonChannel(map, (resultStr) => {
                    let responseMap = JSON.parse(resultStr);
                    let data = responseMap['response'];
                    let id = responseMap['id'];
                    //这两个函数用户拓展的
                    if (FairBasicPluginCallBack[id] === null) {
                        return;
                    }
                    FairBasicPluginCallBack[id](data);
                });
            },
            setXhType: function(type){
                let requestParameter = {};
                requestParameter['className'] = "XhBasicPlugin#setXhType";
                requestParameter['funcName'] = 'invokePlugin';
                requestParameter['pageName'] = '#MisKey#';
                requestParameter['type'] = type;
                let map = JSON.stringify(requestParameter);
                invokeFlutterCommonChannel(map, (resultStr) => {
                })
            },
            sendWmda: function(data){
                let respMap = {};
                respMap = mapOrSetToObject(data);
                let requestParameter = {};
                requestParameter['className'] = "XhBasicPlugin#sendWmda";
                requestParameter['funcName'] = 'invokePlugin';
                requestParameter['pageName'] = '#MisKey#';
                requestParameter['data'] = respMap;
                let map = JSON.stringify(requestParameter);
                console.log('XhBasicPlugin 请求参数：' + map);
                invokeFlutterCommonChannel(map, (resultStr) => {
                })

            },

            getIsDebug: async function(resp){
                let respMap = {};
                respMap=mapOrSetToObject(resp);
                console.log(respMap);
                 let requestParameter = {};
                var id = 'FairBasicPlugin$' + (++FairBasicPluginCallBackId);
                requestParameter['className'] = "XhBasicPlugin#getIsDebug";
                requestParameter['funcName'] = 'invokePlugin';
                requestParameter['pageName'] = '#MisKey#';
                requestParameter['id'] = id;
                FairBasicPluginCallBack[id] = respMap;
                let map = JSON.stringify(requestParameter);
                let a = '1111';
                await new Promise((resolve, reject)=>{
                    invokeFlutterCommonChannel(map, (resultStr) => {
                        a= '2222';
                        resolve();
                        let responseMap = JSON.parse(resultStr);
                        console.log(responseMap);
                        console.log('===========debug');
                        const cb = FairBasicPluginCallBack[id];
                        cb(responseMap['debug']);
                    })
                })
                return a;

            },

    };
}
