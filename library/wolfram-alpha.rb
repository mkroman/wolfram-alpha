# encoding: utf-8

require 'open-uri'
require 'nokogiri'

require 'wolfram-alpha/pod'
require 'wolfram-alpha/client'
require 'wolfram-alpha/subpod'
require 'wolfram-alpha/response'

module WolframAlpha
  RequestURI = "http://api.wolframalpha.com/v2/query?input=%s&appid=%s"

  class << Version = [1,0]
    def to_s; join '.' end
  end
end
