#!/usr/bin/env ruby
# encoding: utf-8

require 'pp'

$:.unshift File.dirname(__FILE__) + '/../library'
require 'wolfram-alpha'

AppId = "52PPLR-44H379TTGL"

client = WolframAlpha::Client.new AppId
client
p client.query("5 in roman numerals").pods[0].subpods[0].text
