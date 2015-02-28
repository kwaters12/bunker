module Bunker

  class Api
    include HTTParty
    base_uri "https://zilyo.p.mashape.com"

    def initialize(service, page)
      headers = { "X-Mashape-Key" => 'mNjnZdZxEWmshmbKoxT8UFC16EO5p1Bc74ijsnFmc2EW3U6pjZ', "Accept" => "application/json" }
      @options = { query: {site: service, page: page}, headers: headers }
    end

    def suggestion
      @response = self.class.get("/search?latitude=52.5306438&longitude=13.3830683&resultsPerPage=1", @options)
      # puts JSON.pretty_generate(@response.request)
      @data = JSON.parse(@response.body)
      puts @data

      puts @data['result'][0]['photos'][0]['large']

    end
  end

end