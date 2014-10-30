require_relative "camara/version"
require "active_support/dependencies/autoload"
require 'faraday'
require 'nokogiri'

module Camara
  extend ActiveSupport::Autoload

  autoload :Connection
  autoload :XmlFields

  module Deputados
    extend ActiveSupport::Autoload

    autoload :Deputado
    autoload :Client

    extend Client
  end

  module Orgaos
    extend ActiveSupport::Autoload

    autoload :Orgao
    autoload :Client

    extend Client
  end

  extend Connection
end

Camara.init
