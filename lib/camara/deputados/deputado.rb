require 'active_support/core_ext/string/inflections'
require 'active_support/concern'


class Camara::Deputados::Deputado
  include Camara::XmlFields
  fields :ideCadastro, :condicao, :nome, :nomeCivil, :numLegislatura
end
