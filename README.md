# README

```shell
bundle init
#railsを入れて
bundle install
bundle exec rails new . --minimal --api --skip-test --skip-active-record
```

- [Rails7 --minimal オプションまとめ](https://zenn.dev/hajime/articles/491c755603d65e)
- [Rails newするときによく指定するオプションまとめ](https://zenn.dev/yukito0616/articles/7cd2dde18c90d4)

## 実験表

打つコマンド

```shell
curl http://localhost:3000/hoge
```


| 実験番号 |                 ddtrace                 | dogstatsd-ruby | ddtraceの設定 |
|:----:|:---------------------------------------:|:--------------:|:-----------|
|  01  |                    o                    |       x        | A          |
|  02  | o(require: 'ddtrace/auto_instrument')※1 |       x        | A          |
|  03  |  o(require: 'ddtrace/auto_instrument')  |       x        | B          |
|  04  |  o(require: 'ddtrace/auto_instrument')  |       x        | C          |
|  05  |  o(require: 'ddtrace/auto_instrument')  |       x        | D          |


※1 `gem 'ddtrace', '1.15.0', require: 'ddtrace/auto_instrument'`


### ddtraceの設定-A

```ruby
#config/initializers/datadog.rb
# わざとコメントアウト(全文なし)
#Datadog.configure do |c|
#end
```

### ddtraceの設定-B

```ruby
#config/initializers/datadog.rb
Datadog.configure do |c|
end
```

### ddtraceの設定-C

```ruby
#config/initializers/datadog.rb
Datadog.configure do |c|
  c.env = 'suna-dev'
end
```

### ddtraceの設定-D

```ruby
#config/initializers/datadog.rb
Datadog.configure do |c|
  c.env = 'suna-dev'
  c.service = 'sunakan'
end
```

### 実験01-結果

```shell
Started GET "/hoge" for 127.0.0.1 at 2023-10-29 19:41:06 +0900
Processing by HogeController#hoge as */*
Completed 200 OK in 32ms (Views: 0.4ms | Allocations: 3080)
```

### 実験02-結果

```shell
[dd.service=rails_datadog_sandbox dd.trace_id=4371089760132579022 dd.span_id=0 ddsource=ruby] Started GET "/hoge" for 127.0.0.1 at 2023-10-29 19:44:34 +0900
[dd.service=rails_datadog_sandbox dd.trace_id=4371089760132579022 dd.span_id=0 ddsource=ruby] Processing by HogeController#hoge as */*
[dd.service=rails_datadog_sandbox dd.trace_id=4371089760132579022 dd.span_id=0 ddsource=ruby] Completed 200 OK in 4ms (Views: 0.1ms | Allocations: 3086)
```

### 実験03-結果

```shell
[dd.service=rails_datadog_sandbox dd.trace_id=3766469878940397025 dd.span_id=0 ddsource=ruby] Started GET "/hoge" for 127.0.0.1 at 2023-10-29 19:46:30 +0900
[dd.service=rails_datadog_sandbox dd.trace_id=3766469878940397025 dd.span_id=0 ddsource=ruby] Processing by HogeController#hoge as */*
[dd.service=rails_datadog_sandbox dd.trace_id=3766469878940397025 dd.span_id=0 ddsource=ruby] Completed 200 OK in 4ms (Views: 0.1ms | Allocations: 3086)
```

### 実験04-結果

```shell
[dd.env=suna-dev dd.service=rails_datadog_sandbox dd.trace_id=2471008752277034450 dd.span_id=0 ddsource=ruby] Started GET "/hoge" for 127.0.0.1 at 2023-10-29 19:48:01 +0900
[dd.env=suna-dev dd.service=rails_datadog_sandbox dd.trace_id=2471008752277034450 dd.span_id=0 ddsource=ruby] Processing by HogeController#hoge as */*
[dd.env=suna-dev dd.service=rails_datadog_sandbox dd.trace_id=2471008752277034450 dd.span_id=0 ddsource=ruby] Completed 200 OK in 4ms (Views: 0.1ms | Allocations: 3086)
```

dd.envに変化

### 実験05-結果

```shell
[dd.env=suna-dev dd.service=sunakan dd.trace_id=966706146009580750 dd.span_id=0 ddsource=ruby] Started GET "/hoge" for 127.0.0.1 at 2023-10-29 19:53:42 +0900
[dd.env=suna-dev dd.service=sunakan dd.trace_id=966706146009580750 dd.span_id=0 ddsource=ruby] Processing by HogeController#hoge as */*
[dd.env=suna-dev dd.service=sunakan dd.trace_id=966706146009580750 dd.span_id=0 ddsource=ruby] Completed 200 OK in 21ms (Views: 0.2ms | Allocations: 3086)
```

dd.serviceに変化

※1 `gem 'ddtrace', '1.15.0', require: 'ddtrace/auto_instrument'`
