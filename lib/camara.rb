require_relative "camara/version"
require_relative 'camara/initialize'
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
    autoload :Partido
    autoload :Gabinete
    autoload :Comissao
    autoload :CargoComissao
    autoload :PeriodoExercicio
    autoload :FiliacaoPartidaria
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
