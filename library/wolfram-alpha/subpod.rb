# encoding: utf-8

module WolframAlpha
  # A subpod is a container for a type of output, such as plain text,
  # numbers, images, etc.
  class Subpod
    # This is the pod that this subpod belongs to.
    attr_accessor :pod

    # Construct a new subpod.
    def initialize pod, element
      @pod, @element = pod, element
    end

    # Access an attribute on the subpod element.
    def [] key
      return @element[key]
    end

    # Get the contents of plaintext as plain text.
    def text
      @element.xpath("plaintext").text
    end
  end
end
