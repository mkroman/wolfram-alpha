# encoding: utf-8

module WolframAlpha
  # This is a response object that wraps the response data in a
  # easily managable object.
  class Response
    include Enumerable
    attr_reader :pods

    # Construct a new response for a +document+.
    def initialize document
      @pods = document.css("pod").map { |element| Pod.new element }
    end

    # Return the first occurence of a pod with the id of +id+.
    def [] id
      find { |pod| pod.id == id }
    end

    # Calls the given block once for each element in self, passing that element as a parameter.
    #
    # An Enumerator is returned if no block is given.
    def each
      return @pods.to_enum unless block_given?

      @pods.each do |pod|
        yield pod
      end
    end
  end
end
