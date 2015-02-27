require 'helper'

describe 'configuration' do

  Bunker::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe ".#{key}" do
      it 'should return the default value' do
        Bunker.send(key).must_equal Bunker::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end

  #^^ This code up here replaces the 4 tests below, and accounts for any new default 
  # values we add to configuration.rb

  # describe '.api_key' do
  #   it 'should return default key' do
  #     Bunker.api_key.must_equal Bunker::Configuration::DEFAULT_API_KEY
  #   end
  # end

  # describe '.format' do
  #   it 'should return default format' do
  #     Bunker.format.must_equal Bunker::Configuration::DEFAULT_FORMAT
  #   end
  # end

  # describe '.user_agent' do
  #   it 'should return default user agent' do
  #     Bunker.user_agent.must_equal Bunker::Configuration::DEFAULT_USER_AGENT
  #   end
  # end

  # describe '.method' do
  #   it 'should return default http method' do
  #     Bunker.method.must_equal Bunker::Configuration::DEFAULT_METHOD
  #   end
  # end

  after do
    Bunker.reset
  end

  describe '.configure' do
    Bunker::Configuration::VALID_CONFIG_KEYS.each do |key|
      it 'should set the #{key}' do
        Bunker.configure do |config|
          config.send("#{key}=", key)
          Bunker.send(key).must_equal key
        end
      end
    end
  end



end