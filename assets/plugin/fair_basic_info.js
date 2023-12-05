let FairBasicInfoPluginCallBack = {};
let FairBasicInfoPluginCallBackId = 0;

let FairBasicInfoPlugin = function() {
    return {
        getAppIsDebug: async function(req) {
            let reqMap = {
                'pageName': '#FairKey#',
                'funcName': 'invokePlugin',
                'className': 'FairBasicInfoPlugin#getAppIsDebug'
            };
            let a = '';
            await new Promise((resolve, reject) => {
                invokeFlutterCommonChannel(JSON.stringify(reqMap), (resultStr) => {
                    let responseMap = JSON.parse(resultStr);
                    a = responseMap['appIsDebug'];
                    resolve();
                })
            })
            return a;
        },
        getAppInfo: async function(req) {
            let id = 'FairBasicInfoPlugin' + (FairBasicInfoPluginCallBackId++);
            // 设置回调
            FairBasicInfoPluginCallBack[id] = req;
            let reqMap = {
                'pageName': '#FairKey#',
                'funcName': 'invokePlugin',
                'className': 'FairBasicInfoPlugin#getAppInfo',
                args: {
                    callId: id
                }
            };

            let a = false;
            await new Promise((resolve, reject) => {
                invokeFlutterCommonChannel(JSON.stringify(reqMap), (resultStr) => {
                    let responseMap = JSON.parse(resultStr);
                    let id = responseMap['callId'];
                    let data = responseMap['data'];
                    //处理需要返回的结果值
                    let callback = FairBasicInfoPluginCallBack[id];
                    if (callback != null) {
                        callback(convertObjectLiteralToSetOrMap(data));
                    }
                    a = convertObjectLiteralToSetOrMap(data);
                    resolve();
                })

            })
            return a;
        }
    }
}