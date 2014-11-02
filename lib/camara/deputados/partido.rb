class Camara::Deputados::Partido
  include Camara::XmlFields
  fields :idPartido, :sigla, :nome, :siglaPartido, :nomePartido, :dataCriacao, :dataExtincao
end
