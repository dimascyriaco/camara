class Camara::Deputados::PeriodoExercicio
  include Camara::XmlFields
  fields :siglaUFRepresentacao, :situacaoExercicio, :dataInicio, :dataFim, :idCausaFimExercicio,
         :descricaoCausaFimExercicio, :idCadastroParlamentarAnterior
end
