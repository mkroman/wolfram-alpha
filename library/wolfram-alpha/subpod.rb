# encoding: utf-8

module WolframAlpha
  class Subpod
    def initialize element
      @element = element
    end

    def text
      if element = @element.search('plaintext')[0]
        element.text
      end
    end
  end
end
