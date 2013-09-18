require 'spec_helper'

describe WolframAlpha::Response do
  subject do
    WolframAlpha::Response.new Nokogiri::XML::Document.new
  end

  describe "default attributes" do
    it "should have a list of pods" do
      expect(subject.pods).to be_an_instance_of Array
    end
  end
end
