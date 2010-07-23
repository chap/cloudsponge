module Cloudsponge
  class CsException < StandardError 
    attr :code
    def initialize(message, code)
      super(message)
      @code = code
    end
  end
end