# SmsVoiceFlash

一种快速接入中国移动，中国联通，中国电信的短信、语音、闪信服务平台的服务接口

使开发者，能够非常方便，快捷，高效地给用户发送短信、语音、闪信通知

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sms_voice_flash'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sms_voice_flash

## Usage

其中:
- key是服务商提供给每个用户的身份凭证
- sign为短信尾巴的签名，最大10个字符长度，如: "中国快递",并需要向服商提前报备
- mobile 用户手机号
- content 发送内容

```ruby
#初始化服务
SmsVoiceFlash.set(key,sign)

#发送短信
SmsVoiceFlash.sms(mobile,content)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sms_voice_flash. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

