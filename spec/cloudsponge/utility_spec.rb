require 'spec_helper'

describe Cloudsponge::Utility do
  it "should decode json" do
    object = { 'key1' => 'value1', 'key2' => 'value2', 'integer_key' => 5 }
    Cloudsponge::Utility.decode_response_body(MultiJson.encode(object)).should eq(object)
  end
end
