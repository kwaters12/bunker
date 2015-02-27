module Bunker
  
  class Data
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def method_missing(method)
      key = data[method.to_s]
      key && key['data']
    end

    def inspect 
      begin
        data = @data.inject([]) { collection << "#{key[0]}L #{key[1]['data']}"; collection }.join("\n   ")
        "#<#{self.class}:0x#{object_id}\n   #{data}>"
      rescue
        "No accomodation information found for the specific location."
      end
    end
  end

  class 