# encoding: utf-8

module WolframAlpha
  class Pod
    attr_reader :subpods

    def [] index; @element[index] end

    def initialize element
      @element = element

      @subpods = element.search('subpod').map &Subpod.method(:new)

      p self['title']
    end
  end
end
