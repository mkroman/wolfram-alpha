#!/usr/bin/gem build
# encoding: utf-8

Gem::Specification.new do |spec|
  spec.name     = "wolfram-alpha"
  spec.version  = "0.3"
  spec.summary  = "Wolfram|Alpha introduces a fundamentally new way to get knowledge and answers — not by searching the web, but by doing dynamic computations based on a vast collection of built-in data, algorithms, and methods."

  spec.homepage = "https://github.com/mkroman/wolfram-alpha"
  spec.license  = "MIT"
  spec.author   = "Mikkel Kroman"
  spec.email    = "mk@uplink.io"
  spec.files    = Dir['library/**/*.rb']

  spec.add_dependency "nokogiri"
	spec.add_development_dependency "rspec"

  spec.require_path = "library"
  spec.required_ruby_version = ">= 1.9.1"
end
