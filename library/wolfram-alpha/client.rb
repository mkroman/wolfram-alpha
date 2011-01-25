# encoding: utf-8

module WolframAlpha
  class Client
    attr_accessor :app_id

    def initialize app_id = nil
      @app_id = app_id
    end

    def query input
      document = Nokogiri::XML File.read("/home/mk/response.xml")#WolframAlpha::RequestURI % [URI.escape(input), @app_id]

      if document.root.name == 'queryresult'
        Response.new document
      else
        raise ArgumentError, "<queryresult> is missing from the api response."
      end
    end
  end
end
