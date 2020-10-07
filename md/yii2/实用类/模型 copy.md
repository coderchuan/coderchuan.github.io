## 模型
* 定义时须继承的类
    * `yii\base\Model`：用于基本的模型
    * `yii\db\ActiveRecord`：用于含有数据库绑定的高级应用模型
    * 继承自定义类(自定义类必须直接或间接继承自`yii\base\Model`类) 
* `yii\base\Model`类
    * 属性
        * [所有属性](https://www.yiichina.com/doc/api/2.0/yii-base-model#properties)
        * 继承的属性
            * [组件](index.html?title=/md/yii2/实用类/组件)
        * 重要属性
            * `errors`
                * 类型：array
                * 功能：存储验证的错误提示信息。每个属性做为键值拥有一个错误消息列表
                * 权限：只读
            * `firstErrors`
                * 类型：array
                * 功能：存储验证的第一条错误提示信息。每个属性做为键值拥有一条错误消息
                * 权限：只读
            * `attributes`
                * 类型：array
                * 功能：外部可访问的属性列表。键值为作属性名，值作为属性值 
                * 权限：读写
    * 方法  
        * [所有方法](https://www.yiichina.com/doc/api/2.0/yii-base-model#methods)
        * 继承的方法
            * [组件](index.html?title=/md/yii2/实用类/组件)
            * [基类](index.html?title=/md/yii2/实用类/基类)
        * 类函数
            * 建议覆写的函数
                * 初始化函数
                    * 特点：在类被构造时自动调用
                    * 形式：有两种，如下：
                        ```php
                        public function __construct($config = [])
                        {
                            //先调用父类的构造函数
                            parent::__construct($config);
                            //然后写初始化语句
                            //...
                        }
                        ```
                        ```php
                        public function init()
                        {
                            //先调用父类的初始化函数 
                            parent::init();
                            //初始化语句
                            //...
                        }
                        ```
                * 用于表单`yii\widgets\ActiveForm`的函数
                    * `public array attributeHints()`
                        * 功能：属性提示。`yii\widgets\ActiveForm`。为避免父类属性提示被覆盖,要求`array_merge(parent::attributeHints(),[属性名=>提示消息,...])`。
                        * 参数:无
                        * 返回值：array。[属性名=>提示消息]
                    * `public array attributeLabels()`
                        * 功能：属性标签。`yii\widgets\ActiveForm`。为避免父类属性提示被覆盖,要求`array_merge(parent::attributeLabels(),[属性名=>提示消息,...])`。
                        * 参数:无
                        * 返回值：array。[属性名=>标签名]
                    * `public string generateAttributeLabel($name)`
                        * 功能：生成标签,优先级低于`attributeLabels()`。根据传入的`name`参数
                        * 参数：name:string。要生成标签的字符串
                        * 返回值：string
                    * `public string formName()`
                        * 功能：表单名,表单中每个`input`标签的`name`属性值的前缀。`yii\widgets\ActiveForm`。不覆写此方法时默认返回类名
                        * 参数：无
                        * 返回值：string
                * `public void afterValidate()`
                    * 功能：执行`validate()`后需要执行的函数
                    * 参数:无
                    * 返回值：无
                * `public boolean beforeValidate()`
                    * 功能：执行`validate()`前需要执行的函数
                    * 参数:无
                    * 返回值：bool,是|否应该执行`validate()`
                * `public array fields()`
                    * 功能：控制Model输出数据。调用`toArray()`时自动调用此方法。默认`对外展示的字段名`与`属性名`相同
                    * 参数：无
                    * 返回值：array
                        * 如果元素是一个索引数组,则相当于该属性的`对外展示的字段名`与`属性名`相同
                        * 如果元素是一个关联数组且值为字符串,则相当于用`对外展示的字段名`代替`属性名`
                        * 如果元素是一个关联数组且值为匿名函数(参数为当前模型),则相当于指定`对外展示的字段名`的值为匿名函数返回的值 
                * `public array extraFields()`
                    * 功能：控制Model输出数据。调用`toArray()`时自动调用此方法。默认`对外展示的字段名`与`属性名`相同
                    * 参数：无
                    * 返回值：array。同`fields()`的返回值含义
                * 
            * 功能函数
                * 属性函数 
                    * setter函数 
                        * `public void setAttributes ( $values, $safeOnly = true )`
                            * 功能：批量设置属性值
                            * 参数
                                * values:array,形式为[属性名=>属性值,...]
                                * safeOnly:bool,根据`rule()`规则不启用(false)|启用(true)安全验证 
                            * 返回值:无
                        * `public void setScenario ( $value )`
                    * getter函数
                        * `public array getAttributes ( $names = null, $except = [] )`
                            * 功能：获取属性值
                            * 参数
                                * names:array|string
                                * except:array,指定不返回的属性列表
                            * 返回值:array,形式为[属性名=>属性值,...]
                        * `public yii\validators\Validator[] getActiveValidators ( $attribute = null )`
                        * `public array getErrors ( $attribute = null )`
                        * `public ArrayIterator getIterator ( )`
                        * `public string getScenario ( )`
                        * `public ArrayObject|yii\validators\Validator[] getValidators ( )`
                * `public string[] activeAttributes()`
                    * 功能：获取`rules()`方法需要用到的属性名称
                    * 参数：无
                    * 返回值：array。返回属性名称组成的数组 
                * `public void addError($attribute, $error = '')`
                    * 功能：为指定的属性添加一条错误消息
                    * 参数
                        * attribute:string,属性名
                        * error:string,错误消息
                    * 返回值：无
                * `public void addErrors(array $items)`
                    * 功能：批量添加错误消息
                    * 参数：items:array,每个属性做为键名拥有一个错误消息列表
                    * 返回值：无
                * `public boolean validate($attributeNames = null, $clearErrors = true)`
                    * 功能：根据`rules()`方法中的规则验证消息
                    * 参数
                        * attributeNames:null|array,null表示所有的属性都要验证,array中指定要验证的属性
                        * clearErrors:bool,是|否在执行验证之前清空错误消息
                    * 返回值：bool,验证通过|未通过
                * `public array attributes()`
                    * 功能：获取属性名称
                    * 参数:无
                    * 返回值：array,由属性名称组成的数组
                * `public array toArray(array $fields = [], array $expand = [], $recursive = true)`
                    * 功能：将模型数据转换为关联数组[属性名=>属性值,...],以便于输出
                    * 参数
                        * fields:array
                            * 如果数组元素是`fields()`中返回的键值,则返回对应的值
                            * 如果数组为空,则返回所有`fields()`中返回的键名对应的值
                            * 如果数组元素是一个由`.`分隔的字符串,有以下情形:
                                * 第1个被分隔的字符串是`fields()`中返回的键名,值为`Model`对象实例2。如果`recursive`为`false`,则此项返回`fields()`中返回的键名对应的值;如果`recursive`为`true`,则继续以下步骤
                                * 第2个被分隔的字符串是`Model`对象实例2的`fields()`中返回的键名,值为`Model`对象实例3
                                * ...
                                * 第n-1个被分隔的字符串是`Model`对象实例n-1的`fields()`中返回的键名,值为`Model`对象实例n
                                * 第n个被分隔的字符串是`Model`对象实例n的`fields()`中返回的键名,此项返回值为`Model`对象实例n`fields()`中定义的值(相当于对每个`Model`对象实例递归调用`toArray([当前被`.`分隔的字符串],[],true)`) 
                        * expand:array
                            * 如果数组元素是`extraFields()`中返回的键值,则返回对应的值 
                            * 如果数组为空,则不返回`extraFields()`中返回的键名对应的值
                            * 如果数组元素是一个由`.`分隔的字符串,如果`recursive`为`true`则有以下情形:
                                * 第1个被分隔的字符串是`extraFields()`中返回的键名,值为`Model`对象实例2。如果`recursive`为`false`,则此项返回`extraFields()`中返回的键名对应的值;如果`recursive`为`true`,则继续以下步骤
                                * 第2个被分隔的字符串是`Model`对象实例2的`extraFields()`中返回的键名,值为`Model`对象实例3
                                * ...
                                * 第n-1个被分隔的字符串是`Model`对象实例n-1的`extraFields()`中返回的键名,值为`Model`对象实例n
                                * 第n个被分隔的字符串是`Model`对象实例n的`extraFields()`中返回的键名,此项返回值为`Model`对象实例n`extraFields()`中定义的值(相当于对每个`Model`对象实例递归调用`toArray([],当前被`.`分隔的字符串,true)`) 
                        * recursive:bool,是|否递归,作用于`fields`与`expand`
                    * 返回值:array,转换后的数组
                * `public string getAttributeHint($attribute)`
                    * 功能：获取属性提示
                    * 参数：属性名称
                    * 返回值：string
                * `public string getAttributeLabel($attribute)`
                    * 功能：获取属性标签
                    * 参数：属性名称
                    * 返回值：string
                * `public void clearErrors($attribute = null)`
                    * 功能：清除验证的错误消息
                    * 参数：attribute,属性名
                    * 返回值：无
                * `public boolean hasErrors($attribute = null)`
                    * 功能：判断是否有验证错误
                    * 参数：attribute,属性名。传入`null`时验证所有参数是否有验证错误
                    * 返回值：bool,有|无验证错误
                * `public boolean isAttributeActive($attribute)`
                    * 功能：判断属性是否处于活动状态
                    * 参数：attribute,要判断的属性名
                    * 返回值：bool,是|否处于活动状态
                * 