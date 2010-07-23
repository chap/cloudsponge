require "test/unit"
require File.dirname(__FILE__) + "/../lib/cloudsponge"

class TestContactImporter < Test::Unit::TestCase
  def test_version_exists
    assert Cloudsponge::VERSION
  end
  
  DOMAIN_KEY = "Your Domain Key"
  DOMAIN_PASSWORD = "Your Domain Password"
  
  def test_u_p_import
    contacts = nil
    importer = Cloudsponge::ContactImporter.new(DOMAIN_KEY, DOMAIN_PASSWORD)
    importer.begin_import('AOL', 'username', 'password')
    loop do
      events = importer.get_events
      break unless events.select{ |e| e.is_error? }.empty?
      unless events.select{ |e| e.is_complete? }.empty?
        contacts = importer.get_contacts
        break
      end
    end
    assert contacts
  end

  def test_auth_import
    contacts = nil
    importer = Cloudsponge::ContactImporter.new(DOMAIN_KEY, DOMAIN_PASSWORD)
    resp = importer.begin_import('YAHOO')
    puts "Navigate to #{resp[:consent_url]} and complete the authentication process."
    loop do
      events = importer.get_events
      break unless events.select{ |e| e.is_error? }.empty?
      unless events.select{ |e| e.is_complete? }.empty?
        contacts = importer.get_contacts
        break
      end
    end
    assert contacts
  end
end
