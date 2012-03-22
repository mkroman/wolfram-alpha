# encoding: utf-8

module WolframAlpha
  # A wrapper for the pod element.
  class Pod
    # @return [Array] an array of sub-pods in this pod.
    attr_reader :subpods

    # Access an attribute on the pod element.
    def [] attribute
      @element[attribute]
    end

    # Construct a new pod with an assigned element, then extract all subpods from it.
    def initialize element
      @element = element

      @subpods = element.xpath("subpod").map { |element| Subpod.new self, element }
    end
  end
end
