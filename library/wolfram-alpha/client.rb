# encoding: utf-8

module WolframAlpha
  # Front object for communicating with the Wolfram|Alpha API.
  class Client
    # The Wolfram|Alpha API developer key, which is set upon initialization.
    attr_accessor :application_key

    # The default options for a new client, it is merged with the options
    # set upon initialization.
    DefaultOptions = {
      timeout: 1
    }

    # Initialize a new client to communicate with the Wolfram|Alpha API.
    #
    # @param [String] application_key The developers API-key that can be easily
    #   obtained from http://products.wolframalpha.com/api/
    # @param [Hash] options A set of options that may be put in the request.
    #
    # @see DefaultOptions
    def initialize application_key = nil, options = {}
      @options = DefaultOptions.merge options
      @application_key = application_key
    end

    # Compute the value of user input, and return a new response.
    #
    # @param [String] query The users input query.
    #
    # @return [Response] The parsed response object.
    def compute query
      document = Nokogiri::XML open request_url(query)

      if document.root.name == "queryresult"
        Response.new document
      else
        raise "Invalid response"
      end
    end

  private

    # Mash together the request url, this is where the request-uri is modified
    # according to the client options.
    #
    # @param [String] query The users input query.
    #
    # @return [String] The complete, formatted uri.
    def request_url query = nil
      escaped_query = CGI.escape query
      formatted_url = WolframAlpha::RequestURI % [escaped_query, @application_key]

      if @options[:timeout]
        formatted_url << "&timeout=#{@options[:timeout]}"
      end

      return formatted_url
    end
  end
end
