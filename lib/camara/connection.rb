module Camara::Connection
  attr_reader :connection

  def default_options
    {
      request: :url_encoded,
      adapter: Faraday.default_adapter
    }
  end

  def init
    @connection = Faraday.new(url: 'http://www.camara.gov.br') do |faraday|
      faraday.request  default_options[:request]
      faraday.adapter  default_options[:adapter]
    end
  end
end
