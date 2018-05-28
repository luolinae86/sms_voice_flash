# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sms_voice_flash/version'

Gem::Specification.new do |spec|
  spec.name          = "sms_voice_flash"
  spec.version       = SmsVoiceFlash::VERSION
  spec.authors       = ["luolin"]
  spec.email         = ["luolinae86@gmail.com"]

  spec.summary       = %q{接入中国移动，联通，电信，发送短信,语音,闪信}
  spec.description   = %q{轻松接入中国移动，联通，电信，给用户发送短信，语音和闪信，方便开发人员使用}
  spec.homepage      = "https://github.com/luolinae86/sms_voice_flash"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
