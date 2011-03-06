# encoding: utf-8

module WolframAlpha
  class Subpod
    attr_accessor :pod

    def initialize pod, element
      @pod, @element = pod, element
    end

    def text
      @element.xpath("plaintext").text
    end
  end
end
