# Yatte App

# version
ruby 2.4.4p296  
Rails 5.2.0  
psql (PostgreSQL) 9.5.13


# setup

postgresqlのユーザー作成・権限の付与
database.ymlにdatabase情報等の記入
```
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: [DBHOSTNAME]
  port: [DBPORT]
  user: [USERNAME]
  password: [PASSWORD]
  database: [DBNAME]

```

```
postgresqlサーバーの起動
$sudo /etc/init.d/postgresql start

$db:migrate:reset  
$rail db:seed  
$rail s  
```








