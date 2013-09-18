require 'spec_helper'

describe WolframAlpha::Client do
  subject do
    WolframAlpha::Client.new ENV['WALPHA'] || 'my-app-token'
  end

  describe "default attributes" do
    before do
      class WolframAlpha::Client
        attr_accessor :http, :options
      end
    end

    it "should have a token" do
      expect(subject.token).to eq 'my-app-token'
    end

    it "should have a http instance" do
      expect(subject.http).to be_an_instance_of Net::HTTP
    end

    it "should have an options hash" do
      expect(subject.options).to be_a Hash
    end

    it "should merge options with default options" do
      expect(subject.options).to include :timeout
    end

    it "should throw an error when no token specified" do
      expect { subject.class.new }.to raise_error
    end
  end

  describe "#request_url" do
    let(:simple_query) { "1 + 1" }

    it "should return a uri" do
      result = subject.send :request_url, simple_query

      expect(result).to be_an_kind_of URI
    end

    it "should merge query parameters with input, app id and options" do
      result = subject.send :request_url, simple_query

      # note: result.query returns a string
      expect(result.query).to include "appid", "input", "timeout"
    end
  end

  describe "querying wolfram-alpha" do
    it "should return a response" do
      response = subject.query "1 + 1"

      expect(response).to be_an_instance_of WolframAlpha::Response
    end
  end
end
