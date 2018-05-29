require "sms_voice_flash/version"
require 'rest-client'
require 'json'

module SmsVoiceFlash

  extend self

  SmsUrl = "https://k.ylb.io/api/message/v0/send"

  def set(key,sign)
    @key = key
    @sign = sign
  end

  def sms(mobile,content)
    url = URI.encode("#{SmsUrl}?apikey=#{@key}&mobile=#{mobile}&content=#{content}&ts=#{Time.now.to_i}&sign=#{@sign}")
    result = JSON.parse(RestClient.get(url).body,object_class: OpenStruct)
  end

end
