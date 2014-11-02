class Camara::Deputados::Partido
  include Camara::XmlFields
  fields :idPartido, :sigla, :nome, :siglaPartido, :nomePartido, :dataCriacao, :dataExtincao, :data_adesao_partido,
         :data_desligamento_partido
end
