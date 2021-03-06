# Markdown通用语法 

## 使用规范约定
* 四个空格作为一个缩进
* 使用一级标题作为文章标题
* 使用二级标题作为章节标题
* 每个标题之间应使用空行分隔
* 标题下的内容不应有缩进
* 顶级列表不应有缩进
* 列表内容应有一个缩进
* 代码块中如果内容是语法，则每行作为一名独立的语句，否则应视为一个整体

## 段落与换行
* 段落：使用一个或多个空白行分隔
* 换行：行末尾使用两个空格+回车键

## 分级标题
* `N`个`#`符号，空格，标题文字。`N`可取`1-6`中的任何一个数字，示例如下：
    ```
    #           一级标题文本
    ##          二级标题文本
    ###         三级标题文本
    ####        四级标题文本
    #####       五级标题文本
    ######      六级标题文本
    ```
* 一级标题与二级标题的其他语法：
    * 标题文本下使用三个`=`符号可表示一级标题
    * 标题文本下使用三个`-`符号可表示二级标题
    * 示例：
        ```
        一级标题文本 
        ===

        二级标题文本 
        ---
        ```

## 引用
* 使用大于符号`>`、空格、引用文本组合而成。在引用中可以使用其他的MarkDown语法。使用示例如下：
    ```
    > 引用的文本内容 
    > ## 这是一个一级标题
    ```

## 列表
* 有序列表
    * 使用数字、空格、列表文本组合而成，如果有序列表在同一个缩进位上，它会自动生成连续的序号，因此，数字可以不是连续地，建议使用数字 `1`
        ```
        1. 条目1
        1. 条目2
        1. 条目3
        ```
* 无序列表 
    * 使用`-`或`+`或`*`、空格、条目文本组合而成 
        ```
        * 条目1
        * 条目2
        * 条目3
        ```
* 综合示例
    * 控制同一级列表条目为相同的缩进(四个空格)可以生成有结构的列表，需要注意的是文档的最顶级列表必须在行最左端：
        ```
        1. 概论
            * 背景
                1. 计算机硬件
                1. 计算机软件
            * 发展历程
                1. CPU 
                1. 编程语言 
        1. 第一章
            * 开始安装
            * 开始调试
        1. 第二章
            * 第一个程序：hello world
            * 牛刀小试
        ```

## 样式
* 斜体。在要倾斜的文字两边各使用一个`*`或`_`包裹
    ```
    *斜体*
    _斜体_
    ```
* 粗体。在要加粗的文字两边各使用两个`*`或`_`包裹
    ```
    **加粗**
    __加粗__
    ```
* 斜粗。在要斜粗的文字两边各使用三个`*`或`_`包裹
    ```
    ***斜粗***
    ___斜粗___
    ```
* 删除线。在要加删除线的文字两边各使用两个`~`包裹
    ```
    ~~删除线~~
    ```
* 横线。
    * 连续三个及以上星号`*`，单独一行 
    * 连续三个及以上减号`-`，单独一行 
    * 连续三个及以上星号`*`中间以空格间隔，单独一行 
    * 连续三个及以上星号`-`中间以空格间隔，单独一行 
    * 示例：
        ```
        ***
        * * *
        ****
        * * * *
        ---
        - - -
        ____
        - - - -
        ```

## 转义字符
* 使用反斜杠`\`对特殊字符进行转义，在markdown语法中，有以下字符作为特殊字符需要转义：
    ```
    > \ ` * _ { } [ ] ( ) # + - . !
    ```

## 行内代码
* 由一个或多个连续的`` ` ``符号作为起始符号和终止符号的文本被视为行内代码
* 使用方法
    * 起始标记符号和终止标记符号`` ` ``的个数相同
    * 起始标记符号后和终止标记符号前应留一个空格
    * 当文本中行内代码原文中确实含有`` ` ``符号时，起始和终止符`` ` ``的个数应与文本中连续出现`` ` ``的个数不同
* 使用示例
    ``` 
    `` 行内代码中含有一个 ` 符号 ``
    ` 行内代码中含有两个 `` 符号 `
    ```

## 代码块
* 代码块原谅中可以使用任何字符
* 使用方法
    * 使用三个及以上`` ` ``符号(后可接语言名称关键字，如`cpp`，不指定语言关键字时默认为纯文本`text`)单独成一行作为起始
    * 代码块原文
    * 使用三个`` ` ``符号单独成一行作为结束
* 支持的语言
    * ActionScript 3.0
        * 语言名称关键字：actionscript3，as3
    * Shell
        * 语言名称关键字：bash，shell
    * ColdFusion
        * 语言名称关键字：coldfusion，cf
    * C、C++
        * 语言名称关键字：cpp，c
    * C#
        * 语言名称关键字：c#，c-sharp，csharp
    * Delphi
        * 语言名称关键字：delphi，pascal，pas
    * diff、patch
        * 语言名称关键字：diff patch
    * Erlang
        * 语言名称关键字：erl，erlang
    * Groovy
        * 语言名称关键字：groovy
    * Java
        * 语言名称关键字：java
    * JavaFX
        * 语言名称关键字：jfx，javafx
    * JavaScript
        * 语言名称关键字：js，jscript，javascript
    * text
        * 语言名称关键字：text，plain
    * Python
        * 语言名称关键字：py，python
    * Ruby
        * 语言名称关键字：ruby，rails，ror，rb
    * SASS、SCSS
        * 语言名称关键字：sass，scss
    * Scala
        * 语言名称关键字：scala
    * SQL
        * 语言名称关键字：sql
    * Visual Basic
        * 语言名称关键字：vb，vbnet
    * XML
        * 语言名称关键字：xml，xhtml，xslt，html
    * Objective C
        * 语言名称关键字：objc，obj-c
    * F#
        * 语言名称关键字：f#，f-sharp，fsharp
    * R
        * 语言名称关键字：r，s，splus
    * matlab
        * 语言名称关键字：matlab
    * swift
        * 语言名称关键字：swift
    * GO
        * 语言名称关键字：go，golang
* 示例
    ````
    ```cpp
    #include<iostream>
    int main (int argc,char ** argv)
    {
        std::cout<<"hello world !";
        return 0;
    }
    ```
    ````

## 超链接/图片/自动链接
* 说明
    * 超链接/图片
        * 直接定义URL，URL可以是当前目录（`./`表示当前目录） 
        * 引用URL_ID。引用其他位置定义好的URL_ID，需要注意的是定义URL_ID的语句应该单独一行且应与非定义URL_ID的语句前后相隔至少一行。
    * 自动链接
        * 自动将邮箱或网址转换为链接形式 
    * 图片标签
        * 使用HTML语法显示图片。可调整图片大小
* 使用方法
    * 语法
        ```
        定义URL_ID：
            [URL_ID]: URL TITLE

        使用超链接：
            [SHOW_TEXT](URL TITLE)
            [SHOW_TEXT][URL_ID]
        
        使用图片：
            ![IMG_TEXT](URL TITLE)
            ![IMG_TEXT][URL_ID]

        使用自动链接：
            <AUTO_LINK>
        
        使用图片标签
            <image style="WIDTH;HEIGHT" src="URL"/>
        ```
    * 语法解释
        * URL_ID
            * 数据类型：text
            * 含义：URL唯一ID，定义的URL_ID不会在正文中显示出来
        * URL
            * 数据类型：text
            * 含义：URL链接
        * TITLE
            * 数据类型：string
            * 含义：鼠标悬停提示文字，可省略
        * SHOW_TEXT
            * 数据类型：text
            * 含义：显示文字
        * IMG_TEXT
            * 数据类型：text
            * 含义：当图片加载失败时，使用此文字显示
        * WIDTH
            * 图片宽度，形式为`width:size`,可省略：`size`可以以`%`或`px`作为单位
        * HEIGHT
            * 图片高度：形式为`height:size`,可省略：`size`可以以`%`或`px`作为单位 
    * 示例
        ```
        定义URL_ID：
            [tencent]: http://www.qq.com "腾讯"
            [baidu]: https://www.baidu.com "百度"
            [baidu_log]: https://logo.baidu.com/images/logo.png "百度LOG"

        使用超链接：
            [百度](https://www.baidu.com "百度")
            [百度][baidu]
            [腾讯][tencent]
        
        使用图片：
            ![百度LOG](https://logo.baidu.com/images/logo.png "百度")
            ![百度LOG][baidu_log]
            
        使用自动链接：
            <http://www.baidu.com>
            <mymessagebox@126.com>

        使用图片标签
            <image style="width:100%" src="./img/86五笔字根表.jpg"/>
        ```
        
# Markdown扩展语法

## 扩展转义字符
```
|
```

## 表格 
* 单元格
    * 每个单元格左右有且只能有一个`|`符号分隔
* 表头字段、表头样式、表体
    * 表头每个字段占用一个单元格
    * 表头每个样式占用一个单元格 
        * `----` 默认样式，通常表示左对齐
        * `:----` 表示该字段左对齐
        * `:----:` 表示该字段居中对齐
        * `----:` 表示该字段右对齐
    * 表体每个数据占用一个单元格
* 示例
    ```
    |阿拉伯数字|罗马数字|中文小写|中文大写|
    |----|:----|:----:|----:|
    |1|I|一|壹|
    |2|II|二|贰|
    |3|III|三|叁|
    |4|IV|四|肆|
    ```