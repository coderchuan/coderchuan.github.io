## ajax使用示例：
* ajax
    * 普通数据
        ```js
        $.ajax({
            type:"post",
            url:"./test7.php",
            data:{"test":"测试"},
            async:true,
            dataType:"json",
            success:function(received){
                console.log(received);
            }
        });
        ```
    * html表单(含文件)
        ```js
        var form_data=new FormData(document.getElementById("file_form"));
        $.ajax({
            type:"post",
            url:"params_deal.php",
            data:form_data,
            //关闭异步
            //async:false,
            cache:false,
            processData:false,
            contentType:false,
            dataType:"json",
            success:function(received){
                console.log(received);
            }
        });
        ```
* post
    ```js
    $.post(
        "./test.php",
        {"test":"测试"},
        function(received){
            console.log(received);
        },
        "html"
    );
    ```
* get
    ```js
    $.get(
        "./test.php",
        {"test":"测试"},
        function(received){
            console.log(received);
        },
        "html"
    );
    ```

## 输出FormData数据 
```js
var form_data=new FormData();
form_data.append("name","张三");
for (var key_value of form_data.values()) {
    console.log(key_value);
}
```
```js
var form_data=new FormData();
form_data.append("name","张三");
for (var [key,value] of form_data.entries()) {
    console.log([key,value]);
} 
```