module Camara::Connection
  attr_reader :connection

  def default_options
    {
      request: :url_encoded,
      response: :logger,
      adapter: Faraday.default_adapter
    }
  end

  def init
    @connection = Faraday.new(url: 'http://www.camara.gov.br') do |faraday|
      faraday.request  default_options[:request]
      faraday.response default_options[:response]
      faraday.adapter  default_options[:adapter]
    end
  end
end
