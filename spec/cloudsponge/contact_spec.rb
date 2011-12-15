require "spec_helper"

describe Cloudsponge::Contact do
  it "should parse with some data fields" do
    data = { 'first_name' => 'John', 'last_name' => 'Smith', 'email' => nil, 'phone' => nil }

    contact = Cloudsponge::Contact.new(data)
    contact.should_not be_nil

    contact.first_name.should eq(data['first_name'])
    contact.last_name.should eq(data['last_name'])
    contact.name.should eq("#{data['first_name']} #{data['last_name']}")
    contact.email.should be_nil
    contact.phone.should be_nil
  end

  it "should parse with all data fields" do
    data = { 'first_name' => 'John', 'last_name' => 'Smith', 'email' => [{ 'address' => 'joe@example.com' }], 'phone' => [{ 'number' => '555-1234' }] }

    contact = Cloudsponge::Contact.new(data)
    contact.should_not be_nil

    contact.first_name.should eq(data['first_name'])
    contact.last_name.should eq(data['last_name'])
    contact.name.should eq("#{data['first_name']} #{data['last_name']}")
    contact.email.should eq('joe@example.com')
    contact.phone.should eq('555-1234')
  end
end
