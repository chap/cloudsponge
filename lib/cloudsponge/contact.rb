module Cloudsponge
  
  class Contact
    attr_accessor :first_name, :last_name, :emails, :phones

    def self.from_array(list)
      list.map { |contact_data| Contact.new(contact_data) }.compact
    end

    def initialize(contact_data)
      # get the basic data
      self.first_name = contact_data['first_name']
      self.last_name = contact_data['last_name']
      # get the phone numbers
      self.phones = []
      contact_data['phone'] && contact_data['phone'].each do |phone|
        self.add_array_value(self.phones, phone['number'], phone['type'])
      end
      self.emails = []
      contact_data['email'] && contact_data['email'].each do |email|
        self.add_array_value(self.emails, email['address'], email['type'])
      end
      self
    end

    def name
      "#{self.first_name} #{self.last_name}"
    end

    def email
      Contact.get_first_value(self.emails)
    end

    def phone
      Contact.get_first_value(self.phones)
    end

    def add_array_value(collection, value, type = nil)
      collection << {:value => value, :type => type}
    end

  private

    def self.get_first_value(from_array)
      from_array && from_array.first && from_array.first[:value]
    end

  end

end