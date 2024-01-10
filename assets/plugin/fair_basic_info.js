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
        getTitle: async function(req) {
            let eventName = '';
            let index = '';
            if (req.index) {
                index = req.index;
            }

            let reqMap = {
                'pageName': '#FairKey#',
                'funcName': 'invokePlugin',
                'className': 'FairBasicInfoPlugin#getTitle',
                'args': {
                    index: index,
                }
            };
            let a = '';
            await new Promise((resolve, reject) => {
                invokeFlutterCommonChannel(JSON.stringify(reqMap), (resultStr) => {
                    let responseMap = JSON.parse(resultStr);
                    a = responseMap['title'];
                    resolve();
                })
            })
            return a;
        },
        sendEvent: async function(req) {
            let eventName = '';
            if (req.eventName) {
                eventName = req.eventName;
            }
            let index = '';
            if (req.index) {
                index = req.index;
            }

            let reqMap = {
                'pageName': '#FairKey#',
                'funcName': 'invokePlugin',
                'className': 'FairBasicInfoPlugin#sendEvent',
                'args': {
                    index: index,
                    eventName: eventName
                }
            };
            let a = '';
            await new Promise((resolve, reject) => {
                invokeFlutterCommonChannel(JSON.stringify(reqMap), (resultStr) => {
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