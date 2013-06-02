# encoding: utf-8

module WolframAlpha
  # A wrapper for the pod element.
  class Pod
    # @return [Array<Subpod>] an list of sub-pods in this pod.
    attr_reader :subpods

    # Construct a new pod with an assigned element, then extract all subpods from it.
    def initialize element
      @element = element

      extract_subpods
    end

    # Returns whether the pod has any subpods.
    def subpods?
      @subpods and @subpods.any?
    end

    # Returns the pod id.
    #
    # @return [String] the pod id.
    def id
      @element["id"]
    end

    # Returns the pod title.
    #
    # @return [String] the pod title.
    def title
      @element["title"]
    end

    # Returns the pod scanner.
    #
    # @return [String] the pod scanner.
    def scanner
      @element["scanner"]
    end

    # Returns the pod position.
    #
    # @return [Fixnum] the pod position.
    def position
      @element["position"].to_i
    end

    # Inspect the pod.
    def inspect
      %{#<#{self.class.name} id: #{id.inspect} title: #{title.inspect} scanner: #{scanner.inspect} position: #{position.inspect} @subpods=#{@subpods.inspect}>}
    end

  private

    # Extract the subpods.
    def extract_subpods
      @subpods = @element.css("subpod").map { |element| Subpod.new self, element }
    end
  end
end
