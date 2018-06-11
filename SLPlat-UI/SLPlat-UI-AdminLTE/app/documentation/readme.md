Angle
=====

概述
--------

本文档旨在解释使用产品及其组件的最佳方式。

__一切顺利，享受编码.__


入门
---------------

### 小提示

- 不要从头开始，使用现有文档并对其进行修改以了解其工作原理。
- 探索想法和示例代码的来源。
- 使用Firebug或Chrome开发人员工具在您的网站上查找错误。 使用这些工具之一将帮助您节省分析站点和查找元素结构的时间，如类，id或标记  -
- 如果有错误消息，有人可能也会看到它，所以您可以尝试使用Google搜索进行快速修复。

### 启动应用程序

由于这是基于AngularJS的应用程序，因此需要服务器（Apache，IIS，xampp等）来提供html文件并执行http请求来加载所有视图。

**重要!** 双击打开index.html（即使用file：//协议）将只显示一个空白页面，因为没有服务器响应每个视图的请求以显示应用界面。（跨域）

定制
-----------

### 结构

在开始定制模板之前，以下是项目文件的组织结构：

```
+-- app/
|   +-- css/
|   +-- documentation/
|   +-- img/
|   +-- js/
|   +-- i18n/
|   +-- pages/
|   +-- vendor/
|   +-- views/
+-- master/
|   +-- jade/
|   |   +-- pages/
|   |   +-- views/
|   +-- js/
|   |   +-- modules/
|   |   |   +-- controllers/
|   |   |   +-- directives/
|   |   |   +-- services/
|   |   +-- custom/
|   +-- less/
|   |   +-- app/
|   |   +-- bootstrap/
|   |   +-- themes/
|   +-- gulpfile.js
|   +-- package.json
|   +-- bower.json
+-- server/
|   +-- *.json
+-- vendor/
+-- index.html
```
---
#### 主文件夹的解释

__app/__ 文件夹
 
该文件夹包含编译的文件 , __这些文件已准备好在您的服务器上进行部署.__
 
- pages/
此文件夹包含单个页面的已编译html文件（不在应用程序中）。
- views/
此文件夹包含用于应用程序的视图和部分的已编译的html文件。
- i18n/
该文件夹包含用于翻译工具使用的的json文件。
- vendor/
该文件夹包含未通过bower进行管理的供应商文件

__master/__ folder
 
该文件夹包含源文件,包含如下文件夹
 
- jade/
该文件夹包含JADE文件, 这些文件需要被编译成html文件，以供浏览器显示。
- less/
该文件夹包含核心样式和引导样式的LESS文件。
- js/
在这里你会找到纯JS文件, 所有这些文件都连接到文件app.js。
 
__vendor/__ folder
 
该文件夹包含用于包含插件和其他组件的供应商文件， 这个文件夹是通过 bower 处理的，所以可以选择使用这种工具删除或升级供应商组件。

__server/__ folder
 
该文件夹包含用于演示和指导浮点图和文件上传组件的服务器端文件。
  
__sidebar-menu.json__

该文件是 __重要并且是必需__ 的，因为它包含侧边栏菜单定义。

### 自定义代码

要添加自己的代码，您可以按照以下说明操作：

__使用 css 和 js__

- 创建一个文件 app/css/custom.css 并添加自己的样式
- 创建一个文件 app/js/custom.js 并添加自己的 javascript
- 编辑文件 index.html 并在其他所有 js 文件之后添加custom.js，在所有其他css文件之后添加custom.css。.

__处理源文件__

- 对于JS，转到文件夹 master/js/custom 并开始编辑文件 custom.js, 在用 gulp 再次编译源代码之后，您自己的代码将包含在文件 app/js/app.js 的底部。
- 对于LESS，转到文件夹 master/less 并创建一个名为 custom.less 的文件, 然后编辑文件 app.less 并 @import 底部的所有样式表（覆盖所有应用默认样式）

__关于更新的说明__

> 不过在这之前，更改的代码越少，更容易应用任何更新, 尽量让自己的代码尽可能与软件包代码尽可能分离，以便在必要时轻松应用新更新。

环境构建
-----

**重要!** 如果您想使用 JADE，LESS 和连接所有 JS 模块，必须遵循此说明。

__Node.js__ 是基于 Chrome 的 JavaScript 运行时构建的平台，可轻松构建快速，可扩展的网络应用程序。

__Gulp__ 是一个任务管理器，您可以定义不同的任务来运行某些命令, 这些命令执行 JADE 和 LESS 的编译工作，并连接 JS 文件。

__Bower__ 是一个依赖管理器，它通过从各处获取和安装软件包来工作，负责搜索，查找，下载和保存您正在查找的内容 , Bower 在清单文件 bower.json 中跟踪这些包。


该软件包在  master/ 文件夹下包含文件 __gulpfile.js__,  __package.json__ and __bower.json__  ，用于安装编译源文件所需的组件。


#### 必须的构建工具

以下步骤旨在成为定向指南，如果没有使用过以下构建工具，你需要从Google了解更多信息:

**注意!** 以下操作可能有一部分会需要翻墙，请寻找对应的国内中文网站或者国内镜像

- 要安装 node.js 和 npm，请转至 http://nodejs.org/
- 运行 __npm install -g bower__ 安装依赖管理工具
- 下载并安装GIT http://git-scm.com/downloads

一旦你安装了所有的工具

- 打开终端。进入  __master/__ 目录, 运行命令 __npm install__. 该命令将安装 gulp 和所有项目依赖项。 
- 然后，要安装依赖包的依赖关系，运行  __bower install__
- 最后运行 __gulp__ 启动任务管理器 

如果一切顺利，你应该在终端上看到如下消息(可能因为系统有所差异)：

```
	Starting watch and LiveReload..
```

他会告诉你大部分任务都完成了, 任务会监视文件，以便在更改时自动编译所有文件。<br/>

要启用自动页面重新加载，还需要一个LiveReload任务，该任务需要Chrome插件 [Livereload](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)，当然你也可以选择手动加载。

### Javascript

Javascript 源代码分为两个控制应用程序的主要文件

__base.js__: 包含启动应用程序的脚本

__app.js__: 包含应用程序中使用的模块（控制器，指令等）

__Note__ 编辑 base.js 中包含的脚本将打开位于主文件夹下的文件 vendor.base.json

app.js 构建（连接）顺序是

```
'js/app.init.js'
'js/modules/*.js'
'js/modules/controllers/*.js'
'js/modules/directives/*.js'
'js/modules/services/*.js'
'js/modules/filters/*.js'
```

### LESS

此框架即支持 SASS 也支持 LESS，我保留了 LESS，删除了 SASS

LESS文件编译成文件 __app.css__. 该文件包含引导程序样式和应用程序自定义样式。

此外，__app-rtl.css__ 会自动生成为相同的样式，但会针对 RTL 布局进行反转, 要转换样式，使用 nodes.js 的 css-flip。

### Vendor

Vendor script 脚本依赖关系由bower管理. 只需要在 master/ 文件夹下运行  __bower install__ 即可安装所有依赖.

安装完所有的依赖关系后，需要将它们安装到应用程序所期望的位置. 为此，请使用该命令运行 gulp 任务  `gulp scripts:vendor`  在主文件内.  
该任务将自动运行任务 `scripts:vendor:app` 和  `scripts:vendor:base`，即在启动时就已经运行完成，此处只是详细介绍出来。

#### Vendor folder

为了避免没有必要的文件下载，任务 `scripts:vendor:app` 它会将应用程序所需的所有文件从 __bower_components__ 文件夹复制到主 __ /vendor__文件夹。 
这些文件在__vendor.json__文件中列出，其中包含应用程序组件所需的所有必需文件的路径, 这些文件通常需要通过延迟加载模块，同时也可以包含字体，svg等。

#### Vendor Base

`base.js` 文件由任务 `scripts：vendor：base` 生成, 该任务将读取 __vendor.base.json__ 文件中的文件列表，将连接并压缩所有文件，并移动它们以创建前面所提到的 base.js 文件。 
base.js 中的所有文件都是在第一次需要应用程序时加载的，并且包含启动应用程序所需的所有供应商脚本（jquery，angular等）。

#### Vendor Updates

要通过 bower 更新Vendor文件，您可以通过添加要下载的最新版本来编辑 bower.json 文件。

__Note__ 文件夹 __app / vendor__ 包含当前无法通过 bower 进行管理的供应商文件

使用方法
-----

### 布局

布局可以通过应用于 __body__ 标签的以下分类进行更改

`.layout-fixed`: 使用户只能滚动内容的同时，使导航条变得固定

`.layout-boxed`: 限制主包装元素的宽度

`.aside-collapsed`: 收缩侧栏仅显示图标

`.aside-toggle`: 在手机内部用于将侧边栏隐藏在屏幕外

`.offsidebar-open`: 用于内部显示反面栏组件（正式的右边栏）

下面的标记表示实际上被分成了多个视图，但是这些代码将在应用程序呈现后给出最终组织的良好视角：这也是 angular.js 的主要思想

``` html
<html>
  <head>
    #metas and css
  </head>  
  <body>
    <section class="wrapper" data-ui-view>

        #start include from app.html
          <nav class="navbar topnavbar">
            #top navbar content
          </nav>
   
          <aside class="aside">
            #sidebar content (left)
          </aside>
   
          <aside class="offsidebar">
            #offsidebar content (right)
          </aside>
   
          <section>
            <div class="content-wrapper" data-ui-view>
              #page content
            </div>  
          </section>
        #end include from app.html

     </section>
 
     #scripts
 
  </body>
</html>
```

### 延迟加载（懒加载）

根据加载的视图，该应用程序只需要必要的脚本，从而将多余的不必要请求保存到服务器。

延迟加载由基于插件的定制核心函数处理 [ocLazyLoad](https://github.com/ocombe/ocLazyLoad)

要配置延迟加载脚本，需要编辑常量 `APP_REQUIRES` (constants.js)
  
然后编辑应用配置（config.js），您将在其中找到路由配置，并使用处理当前路由的脚本请求顺序的特殊函数 `resolveFor` 添加或编辑参数。

### RTL

RTL 支持使用工具 [css-flip](https://github.com/twitter/css-flip) 它反转了大多数CSS属性以改变页面方向。
它也是一个属性`$ rootScope.isRTL`来检测站点何时处于 RTL 模式。

### 路由

这个应用程序用于路由  [AngularUI Router](https://github.com/angular-ui/ui-router) 嵌套状态使管理路由系统和级联负载资源变得更加简单。

所有路由都在文件中定义 __config.js__

### 翻译插件

翻译系统使用  [AngularUI Translate](https://github.com/angular-translate/angular-translate) 模块.  
该模块通过加载来自 JSON 文件的翻译引用并替换引用已被使用的内容来简化翻译系统。

例如：

``` html
<h3 ui-translate="reference.NAME">Text that will be replaced</h3>

<h3>{{ 'reference.NAME' | translate }}</h3>

<a href="#" title="{{ 'reference.NAME' | translate }}">Link</a>
```

带有翻译参考的JSON文件位于该文件夹中  app/i18n

### 动态侧边栏

侧边栏是从 JSON 文件动态创建的。

__JSON 参数格式:__

``` js
[
  {
    "text":      "Item text",          // 由翻译引用取代
    "sref":      "app.dashboard",      // 对应的路由
    "icon":      "icon-speedometer",   // 图标名称
    "translate": "sidebar.ITEM",       // 翻译参考
    "heading":   "true"                // 只有当项目被用作标题时 
  },

  ...

]
```

如果您在服务器中动态生成每个用户菜单，则此方法也很有用。

### Markdown Docs

本文档使用 Markdown 源加载 [Flatdoc](http://ricostacruz.com/flatdoc/) plugin.
菜单和内容是从.md文件自动生成的，并直接从自定义CSS创建样式。

通过`flatdoc`指令，你可以像这样使用它

``` html
<flatdoc src="path/to/readme.md"></flatdoc>
```

### Icons

图标来自

* [__Font Awesome__](http://fortawesome.github.io/Font-Awesome/)
* [__Skycons__](http://darkskyapp.github.io/skycons/)
* [__Weather Icons__](http://erikflowers.github.io/weather-icons/)

### 主题

要更改配色方案，你有两个选项：

#### 编辑 LESS 文件

编辑文件夹中的 LESS 文件 __master/less/app__ 和 __master/less/bootstrap/variables.less__ 使用你想要的颜色。
像 Bootstrap 一样，大多数颜色都基于 `@ brand- *`变量。

您还可以编辑 __master/less/theme__ 文件夹中的文件以创建您自己的一套配色方案, 这些文件必须包含在 __app.css__ 后面才能覆盖默认颜色集。

> 从 LESS 文件更改主题可以帮助您避免通过双重声明颜色规则而导致您的 css 膨胀。

#### 编辑 CSS 文件

此模板支持包含 css 文件的颜色方案, 你可以在文件夹  __app/css/files__ 中找到命名为 theme  -  *。css 的颜色选项

如果您想更改或添加新的组件颜色，只需使用您最喜爱的浏览器 devtool 检查颜色，然后替换文件中的值。

这些文件已准备好更改基本配色方案（包括侧边栏和顶部导航栏），但如果您想进行更深层次的更改，我建议您检查LESS方式，该方式对于多个组件更改更为简单。


指令
----------

该项目包括以下指令。

`[href]`  
*File*: anchor.js  
Disables null anchor behavior

`[animate-enabled]`  
*File*: animate-enabled.js  
Enable or disables ngAnimate for element with directive

`[chosen]`  
*File*: chosen-select.js  
Initializes the chose select plugin

`[classyloader]`  
*File*: classy-loader.js  
Enable use of classyLoader directly from data attributes

`[reset-key]`  
*File*: clear-storage.js  
Removes a key from the browser storage via element click

`[filestyle]`  
*File*: filestyle.js  
Initializes the fielstyle plugin

`[flatdoc]`  
*File*: flatdoc.js  
Creates the flatdoc markup and initializes the plugin

`[form-wizard]`  
*File*: form-wizard.js  
Handles form wizard plugin and validation

`[toggle-fullscreen]`  
*File*: fullscreen.js  
Toggle the fullscreen mode on/off

`[gmap]`  
*File*: gmap.js  
Init Google Map plugin

`[load-css]`  
*File*: load-css.js  
Request and load into the current page a css file

`[markdownarea]`  
*File*: markdownarea.js  
Markdown Editor from UIKit adapted for Bootstrap Layout.

`[masked]`  
*File*: masked.js  
Initializes the masked inputs

`[search-open]`  
*File*: navbar-search.js  
Open the search in the top navbar. Use `[search-dismiss__]   in buttons a`t close it.

`[notify]`  
*File*: notify.js  
Create a notifications that fade out automatically. Based on Notify addon from UIKit (http://getuikit.com/docs/addons_notify.html)

`[now]`  
*File*: now.js  
Provides a simple way to display the current time formatted

`[paneltool]`  
*Module* panel-tools.js  
Directive tools to control panels. Allows collapse, refresh and dismiss (remove) Saves panel state in browser storage.  
Supports attributes [panel-dismiss] [panel-collapse] [panel-refresh]

`[animate]`  
*File*: play-animation.js  
Provides a simple way to run animation with a trigger. Requires animo.js

`[scrollable]`  
*File*: scroll.js  
Make a content box scrollable

`[sidebar]`  
*File*: sidebar.js  
Wraps the sidebar and handles collapsed state

`[skycon]`  
*File*: skycons.js  
Include any animated weather icon from Skycons

`[sparkline]`  
*File*: sparkline.js  
SparkLines Mini Charts

`[check-all]`  
*File*: table-checkall.js  
Tables check all checkbox

`[tagsinput]`  
*File*: tags-input.js  
Initializes the tag inputs plugin

`[toggle-state]`  
*File*: toggle-state.js  
Toggle a classname from the __body__ tag. Useful to change a state that affects globally the entire layout or more than one item.  
Elements must have [toggle-state="CLASS-NAME-TO-TOGGLE"]. Use [no-persist] to avoid saving the sate in browser storage.

`[ui-slider]`  
*File*: ui-slider.js  
Initializes the jQuery UI slider controls

`[validate-form]`  
*File*: validate-form.js  
Initializes the validation plugin Parsley

`[vector-map]`  
*File*: vector-map.js.js  
Initializes jQuery Vector Map plugin


### Bootstrap

这个项目包括来自所有的指令[Angular BootstrapUI].

[Angular BootstrapUI]: http://github.com/api

常量
---------

### 颜色

`APP_COLORS`  
定义可从 JS 访问的 css 中使用的颜色

``` js
App.controller('ExampleCtrl', ['APP_COLORS', function(colors) {
  console.log( colors.primary ); 
  // prints #5d9cec
}]);
```

这个常量与__service colors__一起使用，通过名称提供从$ scope到每种颜色的访问

Example 

``` html
<div sparkline data-bar-color="{{colorByName('primary')}}" ></div>
```

### 媒体查询

`APP_MEDIAQUERY`  
定义从JS可访问CSS中使用的媒体查询

``` js
App.controller('ExampleCtrl', ['APP_MEDIAQUERY', function(mq) {
  console.log( mq.mobile ); 
  // prints 480
}]);
```
### Requires

`APP_REQUIRES`  
定义用于延迟加载系统的脚本。

格式:

``` js
// 把这里所有的jQuery脚本（而不是angular js）
scripts: {
  'friendly-name' : ['path/to/plugin.js', 'path/to/plugin.css', '...'],
  ...
}
// 在这里放置所有需要实例化的angular js模块
modules: {
  { 
    name: 'toaster', files: ['path/to/module.js', 'path/to/module.css', '...']
  },
  ...
}
```

通过查看文件了解更多信息 __config.js__

Credits
-------
<div class="row">
<div class="col-lg-3">

[Angular](https://angularjs.org/)  
[Angular Docs](https://docs.angularjs.org/guide/)  
[ocLazyLoad](https://github.com/ocombe/ocLazyLoad)  
[uiRouter](https://github.com/angular-ui/ui-router)  
[uiTranslate](https://github.com/angular-translate/angular-translate)  
[uiBootstrap](http://angular-ui.github.io/bootstrap/)  
[Toaster](https://github.com/jirikavi/AngularJS-Toaster)  
[Angular Loading Bar](http://chieffancypants.github.io/angular-loading-bar/)  
[Bootstrap](http://getbootstrap.com/)  
[jQuery]( http://jquery.com/)  
[Fastclick](https://github.com/ftlabs/fastclick)  
[Animo](http://labs.bigroomstudios.com/libraries/animo-js)  
[Animate.css](http://daneden.github.io/animate.css/)  
[Chosen](http://harvesthq.github.io/chosen/)  
[Codemirror](http://codemirror.net/)  
[BS Filestyle](http://markusslima.github.io/bootstrap-filestyle/)  
[FlotCharts](http://www.flotcharts.org/)  
[gMap](http://github.com/marioestrada/jQuery-gMap)  
[Marked](https://github.com/chjj/marked)  
[ClassyLoader](http://www.class.pm/projects/jquery/classyloader/)  
[CSSRadialBar](http://codepen.io/geedmo/pen/InFfd)  
</div>
<div class="col-lg-3">

[Modernizr](http://modernizr.com/)  
[MomentJs](http://momentjs.com/)  
[Parsley](http://parsleyjs.org/)  
[Bootstrap Slider](http://www.eyecon.ro/bootstrap-slider)  
[Sparkline](http://omnipotent.net/jquery.sparkline/#s-about)  
[BS Tags Input](http://timschlechter.github.io/bootstrap-tagsinput/examples/bootstrap3/)  
[slimSCroll](http://rocha.la/jQuery-slimScroll)  
[DataTables](https://datatables.net/.)  
[FullCalendar](http://arshaw.com/fullcalendar/docs/)  
[CsSpinner](http://jh3y.github.io/-cs-spinner/)  
[InputMask](https://github.com/RobinHerbots/jquery.inputmask)  
[jVectorMap](http://jvectormap.com/)  
[FlatDoc](https://github.com/rstacruz/flatdoc)  
[jQueryUI](http://jqueryui.com/sortable/)  
[UiKit Upload](http://www.getuikit.com/docs/addons_upload.html)  
[UiKit Notify](http://www.getuikit.com/docs/addons_notify.html)  
[UiKit MarkdownArea](http://www.getuikit.com/docs/addons_markdownarea.html)
  
</div>
<div class="col-lg-3">

Icons  

[Font Awesome](http://fortawesome.github.io/Font-Awesome/)  
[Skycons](http://darkskyapp.github.io/skycons/)  
[Weather Icons](http://erikflowers.github.io/weather-icons/)  
<br>
Demo images  

[uiFaces](http://uifaces.com/)  
[Raumrot](http://www.raumrot.com/10/)  
[Unsplash](http://unsplash.com)  
</div>
</div>
