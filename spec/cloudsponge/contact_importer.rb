require 'spec_helper'

describe Cloudsponge::ContactImporter do
  DOMAIN_KEY = "Your Domain Key"
  DOMAIN_PASSWORD = "Your Domain Password"

  it "should import from AOL" do
    contacts = nil
    importer = Cloudsponge::ContactImporter.new(DOMAIN_KEY, DOMAIN_PASSWORD)
    importer.begin_import('AOL', 'username', 'password')

    loop do
      events = importer.get_events
      break unless events.select { |e| e.is_error? }.empty?
      unless events.select { |e| e.is_complete? }.empty?
        contacts = importer.get_contacts
        break
      end
    end

    contacts.should_not be_nil
  end

  it "should import from YAHOO" do
    contacts = nil
    importer = Cloudsponge::ContactImporter.new(DOMAIN_KEY, DOMAIN_PASSWORD)
    resp = importer.begin_import('YAHOO')
    puts "Navigate to #{resp[:consent_url]} and complete the authentication process."

    loop do
      events = importer.get_events
      break unless events.select { |e| e.is_error? }.empty?
      unless events.select { |e| e.is_complete? }.empty?
        contacts = importer.get_contacts
        break
      end
    end

    contacts.should_not be_nil
  end
end
