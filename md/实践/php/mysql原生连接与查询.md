## mysql原生连接与查询
```php
class MysqlOption
{
    public static function getDbConnection(&$dbConnection,string $dbName) 
    {
        $dbConfig=[
            'debian_localhost'=>array(
                'dsn' => 'mysql:host=192.168.32.28;dbname=test;port=5000;charset=UTF8;',
                'username' => 'root',
                'password' => 'root',
            )
        ];
        if(isset($dbConfig[$dbName]))
        {
            try
            {
                $db=$dbConfig[$dbName];
                $dbConnection=new \PDO(
                    $db['dsn'],
                    $db['username'],
                    $db['password'],
                    [
                    \PDO::ATTR_PERSISTENT=>false,
                    \PDO::ATTR_EMULATE_PREPARES=>false
                    ]
                );
            }catch(\Exception $e)
            {
                $dbConnection=null;
            }
            return ;
        }
        $dbConnection=null;
    }

    public static function queryAll(&$db,$sql,$data=[])
    {
        $streamSql=$db->prepare($sql);
        $streamSql->execute($data);
        return $streamSql->fetchAll(\PDO::FETCH_ASSOC);
    }
    public static function queryColumn(&$db,$sql,$data=[])
    {
        $streamSql=$db->prepare($sql);
        $streamSql->execute($data);
        return $streamSql->fetchAll(\PDO::FETCH_ASSOC|\PDO::FETCH_COLUMN);
    }
    public static function queryOne(&$db,$sql,$data=[])
    {
        $streamSql=$db->prepare($sql);
        $streamSql->execute($data);
        return $streamSql->fetch(\PDO::FETCH_ASSOC);
    }
    public static function queryScalar(&$db,$sql,$data=[])
    {
        $streamSql=$db->prepare($sql);
        $streamSql->execute($data);
        return $streamSql->fetch(\PDO::FETCH_ASSOC|\PDO::FETCH_COLUMN);
    }
    public static function execute(&$db,$sql,$data=[])
    {
        $streamSql=$db->prepare($sql);
        return $streamSql->execute($data);
    }
}
```
