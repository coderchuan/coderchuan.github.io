## phpdoc
* 功能：通过编辑具有phpdoc格式的注释，为类或函数添加说明，此说明可以被IDE所解析用于代码提示
* 格式
    ```php
    /**
     * FUNCTION_EXPLAIN_TEXT
     * KEY_NAME KEY_EXPLAIN_TEXT
     * KEY_NAME KEY_EXPLAIN_TEXT
     * KEY_NAME KEY_EXPLAIN_TEXT
     * ...
     */
    ```
* 解释
    * `FUNCTION_EXPLAIN_TEXT`:功能说明
    * `KEY_EXPLAIN_TEXT`:对关键字所代表的内容的说明。内容说明详见各个`KEY_NAME`格式说明
    * `KEY_NAME`:关键字，包括以下值
        * @author：作者
            * 格式：`姓名 [邮箱]`
        * @package：命名空间
            * 格式：`命名空间`
        * @param：函数传入参数
            * 格式：`类型 名称 说明` 
        * @return：返回值
            * 格式：`类型 说明` 
        * @example：使用示例
            * 格式：`示例文件位置 [起始行号 [行数]] 描述]`
        * @see：参考内容
            * 格式：`url或其他引用方式 说明` 
        * @version：版本
            * 格式：`版本号 描述`
        * @api：表示这是一个api接口，无说明文字
            * 格式：无
        * @copyright：版权声明
            * 格式：`版权描述`
        * @global：全局变量
            * 格式：`[类型] [名称] [描述]`
        * @global：全局变量
            * 格式：`[类型] [名称] [描述]`
        
