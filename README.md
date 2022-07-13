# dim-coord

#### 介绍

使用autolisp实现的坐标标注cad插件。

#### 软件架构

使用纯autolisp 实现，不含 visual lisp 代码。理论上讲，支持在下列cad系统中使用：
- AutoCAD 2000~2022
- AutoCAD mac版
- BricsCAD
- 国产的中望、浩辰
- 其他支持autolisp API的cad系统

#### 安装教程

无需安装，下载即可用。

#### 使用说明

1. 将lsp文件或fas文件用鼠标拖拽至cad绘图区域即可。
2. 或者，在cad命令行输入`appload`命令，加载lsp文件或fas文件。
3. 插件加载到cad之后，会在命令行显示**启动命令**。
4. 在cad命令行输入插件**启动命令**，即可运行插件。

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request
