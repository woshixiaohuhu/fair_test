GLOBAL['#FairKey#']=(function(__initProps__){const __global__=this;return runCallback(function(__mod__){with(__mod__.imports){function _TestListViewGetIndexTitleState(){const inner=_TestListViewGetIndexTitleState.__inner__;if(this==__global__){return new _TestListViewGetIndexTitleState({__args__:arguments});}else{const args=arguments.length>0?arguments[0].__args__||arguments:[];inner.apply(this,args);_TestListViewGetIndexTitleState.prototype.ctor.apply(this,args);return this;}}_TestListViewGetIndexTitleState.__inner__=function inner(){this.issueTasks=[];};_TestListViewGetIndexTitleState.prototype={issueTaskCount:function issueTaskCount(){const __thiz__=this;with(__thiz__){}},getTitle:async function getTitle(index){const __thiz__=this;const __arg_ctx__={index,};with(__thiz__){with(__arg_ctx__){let title=await FairBasicInfoPlugin().getTitle({index:index});print(`title:${title}`);return title;}}},};_TestListViewGetIndexTitleState.prototype.ctor=function(){};;return _TestListViewGetIndexTitleState();}},[]);})(convertObjectLiteralToSetOrMap(JSON.parse('#FairProps#')));