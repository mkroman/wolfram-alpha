# encoding: utf-8

module WolframAlpha
  class Response
    attr_reader :pods

    def initialize document = nil
      @document = document

      @pods = @document.xpath("//pod").map { |element| Pod.new element }
    end
  end
end
