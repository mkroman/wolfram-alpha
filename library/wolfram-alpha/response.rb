# encoding: utf-8

module WolframAlpha
  class Response
    attr_reader :pods

    def initialize document
      @pods = document.search('pod').map &Pod.method(:new)
    end
  end
end
