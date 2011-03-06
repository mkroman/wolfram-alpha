# encoding: utf-8

module WolframAlpha
  class Client
    attr_accessor :app_id

    def initialize app_id = nil
      @app_id = app_id
    end

    def compute query
      document = Nokogiri::XML open WolframAlpha::RequestURI % [URI.escape(query), @app_id]#File.open("/home/mk/Documents/response.xml")

      if document.root.name == "queryresult"
        Response.new document
      else
        raise "Invalid response"
      end
    end
  end
end
