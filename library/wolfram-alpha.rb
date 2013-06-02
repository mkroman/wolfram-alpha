# encoding: utf-8

require 'cgi'
require 'net/http'
require 'nokogiri'

require 'wolfram-alpha/pod'
require 'wolfram-alpha/client'
require 'wolfram-alpha/subpod'
require 'wolfram-alpha/response'

# Wolfram|Alpha introduces a fundamentally new way to get knowledge and answers—
# not by searching the web, but by doing dynamic computations based on a vast collection of
# built-in data, algorithms, and methods.
#
# @author Mikkel Kroman
module WolframAlpha
  # The current version of the WolframAlpha library.
  Version = "0.3"

  # The API request-uri.
  RequestURI = URI "http://api.wolframalpha.com/v2/query"
end
