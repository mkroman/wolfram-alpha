# encoding: utf-8

module WolframAlpha
  class Client
    # The Wolfram|Alpha API application id, which is set upon initialization.
    attr_accessor :token

    # The default options for a new client, it is merged with the options
    # set upon initialization.
    Options = {
      timeout: 15
    }

    # Initialize a new client to communicate with the Wolfram|Alpha API.
    #
    # @param [String] token The developers API-id that can be freely
    #   obtained from http://products.wolframalpha.com/api/
    # @param [Hash] options A set of options that may be put in the request.
    #
    # @see DefaultOptions
    def initialize token, options = {}
      @http = Net::HTTP.new RequestURI.host, RequestURI.port
      @token = token or raise "Invalid token"
      @options = Options.merge options
    end

    # Compute the result of +input+, and return a new response.
    #
    # @param [String] input The input query.
    #
    # @return [Response] The parsed response object.
    def query input
      response = @http.get request_url(input).request_uri
      document = Nokogiri::XML response.body

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
    # @param [String] input The input query.
    #
    # @return [String] The complete, formatted uri.
    def request_url input
      query = { "appid" => @token, "input" => "#{input}" }.merge @options

      RequestURI.dup.tap do |this|
        this.query = URI.encode_www_form query
      end
    end
  end
end
