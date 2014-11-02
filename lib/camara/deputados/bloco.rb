class Camara::Deputados::Bloco
  include Camara::XmlFields
  fields :idBloco, :nomeBloco, :siglaBloco, :dataCriacaoBloco, :dataExtincaoBloco,
         partidos: [Camara::Deputados::Partido]
end
