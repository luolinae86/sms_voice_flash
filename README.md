# SmsVoiceFlash

一种快速接入中国移动，中国联通，中国电信的短信、语音、闪信服务平台的服务接口

使开发者，能够非常方便，快捷，高效地给用户发送短信、语音、闪信通知

## 安装步骤

在Gemfile文件中，添加下面这一行

```ruby
gem 'sms_voice_flash'
```

然后执行

    $ bundle

或者手动安装

    $ gem install sms_voice_flash

## 参数及使用说明

### 参数介绍
传入参数:
- key是服务商提供给的一串字符，为不同客户的身份凭证
- sign为短信尾巴的签名，最大10个字符长度，如: "中国快递",并需要向服商提前报备
- mobile 用户手机号，支持单条发送，也支持以数组的形式发送
- content 发送内容

## 发送短信 
```ruby
#初始化服务
#假定 key = "LKiw2STo1NvouhQ4OKOw6hrdp" sign = "中国快递"

SmsVoiceFlash.set(key,sign)

#单条发送短信
#假定mobile = "13512345678" content = "我爱Ruby"

SmsVoiceFlash.sms(mobile,content)

#多条发送
#假定 mobile = ["13512345678","13612345678","18612345678"],content="我爱ruby"

SmsVoiceFlash.sms(mobile,content)

```
### 返回值说明
返回值为json格式
- code    返回码
- message 信息描述
- uid     本条消息唯一识别码，请保留用来跟踪消息的后续状态。

返回值 
- 正常返回 {"code":0,"message":"正在发送","uid":"iSrXps3QHYCt9CeoEySPrvUo6Lhr1MIg"}
- 异常返回
 - {"message": "Your authentication credentials are invalid"}
 - {"message":"API rate limit exceeded"} 默认发送速率为，5条每秒，如果超过上限会提示这个错误
 - {"code":2,"message":"手机号码不正确","uid":""}
 - {"code":3,"message":"ts参数错误,注意是秒单位，误差不能超过5分钟","uid":""}
 - {"code":4,"message":"发送内容不正确","uid":""}
 - {"code":5,"message":"签名信息不正确","uid":""}

### 获取发送消息返回值

```ruby
result = SmsVoiceFlash.sms(mobile,content)

code    = result.code
message = result.code
uid     = result.code

```

## 获取短信状态 
```ruby

SmsVoiceFlash.set(key)
SmsVoiceFlash.report

```
### 短信状态说明

- 返回 json 数组 
 - type , string 为 report 或 mo ，  report类型为发送状态， mo为短信上行 
 - uid  消息唯一识别码，这里的uid是之前发送接口返回的uid，拿到uid就可以更新数据库里面短信状态
 - mobile 手机号码
 - message  返回内容:
  - type=report 时"SUCCESS" 代表投递成功，其他代码投递失败
  -  type=mo 时， 该内容为上行消息内容 
 - ts  为消息产生时的 时间戳


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

```ruby
git clone git@github.com:luolinae86/sms_voice_flash.git
cd sms_voice_flash
bundle console # 请不要使用 irb，可能会有依赖问题
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

