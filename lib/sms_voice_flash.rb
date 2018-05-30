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
    #如果用户输入的为数组，则将数组内的元素用逗号分隔成字符串
    if mobile.kind_of?(Array)
      mobile.map!{|number| number.strip}.join(",")
    end
    url = URI.encode("#{SmsUrl}?apikey=#{@key}&mobile=#{mobile}&content=#{content}&ts=#{Time.now.to_i}&sign=#{@sign}")
    result = JSON.parse(RestClient.get(url).body,object_class: OpenStruct)
  end

end
