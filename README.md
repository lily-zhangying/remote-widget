#remote-widget

## 介绍

FIS quickling方案中， 实现异步请求其他域名widget的功能


## 使用demo

以下文档中，发起请求的域名我们成为客户端A, 其他域名我们成为服务端B.

1. 下载A_client_side和B_server_side，分别部署到不同机器。
2. 两台机器都安装fisp后，分别执行以下命令，开启服务器

```bash
    fisp release
    fisp server start
```

2. 修改A_client_side中config/remote_widget.json代码。修改rule1中的domain到服务器B的地址（domain，注意修改端口）
3. 在A机器浏览器中输入 http://localhost:8080/demo/page/index 预览页面效果


## 使用

以下文档中，发起请求的域名我们成为客户端A, 其他域名我们成为服务端B.

### 客户端A

客户端A使用remote_widget插件

```tpl
{%remote widget name="remote:widget/a/a.tpl" pagelet_id="remote_container" rule="rule1" %}
```

参数：
* name : widget名字
* pagelet_id : 页面pagelet容器
* rule : 远程url规则。从smarty config目录下的remote_widget.json中读取。

### rule 请求规则

remote_widget.json，上线时需要发布到smarty config目录下. 
本地放在common/config/remote_widget.json即可。

```json
{
    "rule1" : {
        "domain" : "http://aaa.baidu.com:8000",
        "url" : "/pagelet/page/index",
        "params" : {
            "a" : "a",
            "b" : "$b.value",
            "test" : "$test.v.value"
        }

    },
     "rule2" : {
        "domain" : "http://172.111.11.111:8888",
        "url" : "/pagelet/page/index"
    }
}
```
* domain ： 域名
* url： 请求路径
* params ： 请求url中参数列表，**支持smarty变量的形式** 。**注意变量前面一定要加$符号**
* remote_widget插件使用rule1的时候，请求的url为：http://aaa.baidu.com:8000/pagelet/page/index?pagelet[]=some_pagelet&force_mode=1&t=123313&a=a&b=b_value&test=test_value


## 服务端B

**服务端必须也使用FIS quickling解决方案** 。被客户端A请求的模板必须包括以下代码

```tpl
{%widget name="remote:widget/a/a.tpl" pagelet_id="remote_container" mode="quickling" %}
```

* widget name 与客户端A保持一致
* pagelet_id 与客户端A保持一致


## remote_widget插件工作流程
1. 发送ajax请求到某url，返回的json数据
2. 页面调用 BigPipe.onPagelets(json, id) 来渲染到页面。

## 原有QUICKLING方案接入remote_widget

### BigPipe.js更新
* 确认BigPipe.js中有BigPipe.onPagelets方法。
* 原quickling中lazyrender方案没有此方法，[更新地址](https://github.com/lily-zhangying/remote-widget/blob/master/A_client_side/static/BigPipe.js)
* 其他方案中有此方法的不用更新


### 插件更新

1. 直接更新原有quickling方案的插件，[新插件](https://github.com/lily-zhangying/fis-smarty-bigpipe-plugin)

#### 定制插件

2. 如果原有quickling插件经过定制，请自行修改两处代码

    1. 新增 [remote_widget插件](https://github.com/lily-zhangying/fis-smarty-bigpipe-plugin/blob/master/compiler.remote_widget.php)，
    拷贝新插件到项目  plugin/目录下

    2. 新增 [lib/FISPagelet.class.php](https://github.com/lily-zhangying/fis-smarty-bigpipe-plugin/blob/master/lib/FISPagelet.class.php)，
    
        1. 159 行  public static function registerRemoteWidgetRules($smarty){}
        2. 250 行  static public function remote_start($id, $rulename, $smarty) {}

    拷贝以上两个方法到项目  plugin/lib/FISPagelet.class.php 中即可


