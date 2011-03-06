#!/usr/bin/env ruby
# encoding: utf-8

require 'pp'

$:.unshift File.dirname(__FILE__) + '/../library'
require 'wolfram-alpha'

AppId = "52PPLR-44H379TTGL"

client = WolframAlpha::Client.new AppId
p client.compute("the age of the universe").pods[1].subpods[0].text
