# encoding: utf-8

$:.unshift File.dirname(__FILE__) + '/../library'
require 'wolfram-alpha'

unless ENV['WALPHA']
  warn "WARNING: WALPHA environment variable not set, specs will fail!"
end
