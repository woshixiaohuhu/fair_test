GLOBAL['#FairKey#']=(function(__initProps__){const __global__=this;return runCallback(function(__mod__){with(__mod__.imports){function _TestBasicInfoState(){const inner=_TestBasicInfoState.__inner__;if(this==__global__){return new _TestBasicInfoState({__args__:arguments});}else{const args=arguments.length>0?arguments[0].__args__||arguments:[];inner.apply(this,args);_TestBasicInfoState.prototype.ctor.apply(this,args);return this;}}_TestBasicInfoState.__inner__=function inner(){this.os=null;this.version=null;this.isDebug=null;};_TestBasicInfoState.prototype={onLoad:function onLoad(){const __thiz__=this;with(__thiz__){os=' ';version=' ';isDebug=false;}},onTap:async function onTap(method){const __thiz__=this;const __arg_ctx__={method,};with(__thiz__){with(__arg_ctx__){if(method==1){let a=await FairBasicInfoPlugin().getAppIsDebug();isDebug=a;setState('#FairKey#',function dummy(){});}else{let result=await FairBasicInfoPlugin().getAppInfo(null);os=result.__op_idx__('os');version=result.__op_idx__('version');isDebug=result.__op_idx__('appIsDebug');setState('#FairKey#',function dummy(){});}}}},test3:function test3(){const __thiz__=this;with(__thiz__){FairBasicInfoPlugin().getAppInfo(function dummy(result){os=result.__op_idx__('os');version=result.__op_idx__('version');isDebug=result.__op_idx__('appIsDebug');setState('#FairKey#',function dummy(){});});}},};_TestBasicInfoState.prototype.ctor=function(){};;return _TestBasicInfoState();}},[]);})(convertObjectLiteralToSetOrMap(JSON.parse('#FairProps#')));