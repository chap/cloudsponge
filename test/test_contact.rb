require "test/unit"
require "cloudsponge"

class TestContact < Test::Unit::TestCase
  def test_new_from_data
    data = {'first_name' => 'John', 'last_name' => 'Smith', 'email' => nil, 'phone' => nil}
    assert contact = Cloudsponge::Contact.new(data)
    assert_equal data['first_name'], contact.first_name
    assert_equal data['last_name'], contact.last_name
    assert_equal "#{data['first_name']} #{data['last_name']}", contact.name
    assert_equal nil, contact.email
    assert_equal nil, contact.phone

    data = {'first_name' => 'John', 'last_name' => 'Smith', 'email' => [{'address' => 'joe@example.com'}], 'phone' => [{'number' => '555-1234'}]}
    assert contact = Cloudsponge::Contact.new(data)
    assert_equal data['first_name'], contact.first_name
    assert_equal data['last_name'], contact.last_name
    assert_equal "#{data['first_name']} #{data['last_name']}", contact.name
    assert_equal 'joe@example.com', contact.email
    assert_equal '555-1234', contact.phone
  end
end
