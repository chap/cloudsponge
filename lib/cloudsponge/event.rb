module Cloudsponge
  EVENT_TYPES = %w{ INITIALIZING GATHERING SUBMITTING COMPLETE ERROR}
  EVENT_STATUSES = %w{ PENDING INPROGRESS COMPLETED ERROR }
  
  class Event
    attr_accessor :event_type, :status, :value, :description

    def self.from_array(list)
      list.map { |event_data| Event.new(event_data) }.compact
    end

    def inspect
        "\#<#{self.class} #{event_type} #{status} #{value}>"
    end

    def initialize(event_data)
      # is it an error?
      
      # get the basic data
      self.event_type = event_data['event_type']
      self.status = event_data['status']
      self.value = event_data['value']
      self.description = event_data['description']
      self
    end
    
    def is_error?
      self.status == 'ERROR'
    end

    def is_complete?
      self.event_type == 'COMPLETE' && self.status == 'COMPLETED'
    end

  end

end
