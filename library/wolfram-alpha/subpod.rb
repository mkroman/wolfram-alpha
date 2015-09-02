# encoding: utf-8

module WolframAlpha
  class Subpod
    attr_reader :element
    # Construct a new pod with an assigned element.
    def initialize parent, element
      @parent = parent
      @element = element
    end

    # Returns whether the subpod contains a plaintext element.
    def plaintext?
      not plaintext.nil?
    end

    # Returns the plaintext element as text.
    #
    # @return [String] the plain text.
    def plaintext
      @plaintext ||= @element.at_css("plaintext").text
    end

    def image
      @image ||= @element.at_css("img")[:src]
    end

    # Inspect the subpod.
    def inspect
      %{#<#{self.class.name} plaintext: #{plaintext.inspect}>}
    end
  end
end