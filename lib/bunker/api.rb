module Bunker

  class Api
    include HTTParty
    base_uri "https://zilyo.p.mashape.com"

    def initialize(service, page)
      headers = { "X-Mashape-Key" => 'mNjnZdZxEWmshmbKoxT8UFC16EO5p1Bc74ijsnFmc2EW3U6pjZ', "Accept" => "application/json" }
      @options = { query: {site: service, page: page}, headers: headers }
    end

    def suggestion
      self.class.get("/search", @options)
    end
  end

end