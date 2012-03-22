# encoding: utf-8

module WolframAlpha
  # This is a response object that wraps the response data in a
  # easily managable object.
  #
  # @see #input_as_text
  # @see #result_as_text
  class Response
    attr_reader :pods

    # Construct a new response for a +document+.
    def initialize document = nil
      @document = document

      @pods = @document.xpath("//pod").map {|element| Pod.new element }
    end

    # Return the pod containing the subpods which is of type +input+.
    def input
      find_pod_with_id "Input"
    end

    # Map and join the input interpreted pod's subpods as a printable string.
    def input_as_text
      input.subpods.map(&:text).join ', '
    end

    # Return the pod containing the subpods which is of type +result+.
    def result
      find_pod_with_id "Result"
    end

    # Map and join the result pod's subpods as a printable string.
    def result_as_text
      result.subpods.map(&:text).join ', '
    end

  private

    # Find a pod of which id is +id+.
    def find_pod_with_id id
      @pods.find do |pod|
        pod["id"] == id
      end
    end
  end
end
