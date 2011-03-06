# encoding: utf-8

module WolframAlpha
  class Pod
    attr_reader :subpods

    def initialize element
      @element = element

      @subpods = element.xpath("subpod").map { |element| Subpod.new self, element }
    end
  end
end
