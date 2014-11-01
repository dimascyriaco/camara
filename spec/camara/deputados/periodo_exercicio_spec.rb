require 'spec_helper'

describe Camara::Deputados::PeriodoExercicio do
  it 'has fields' do
    periodo_exercicio = Camara::Deputados::PeriodoExercicio.new(Nokogiri::XML(''))
    expect(periodo_exercicio).to have_fields :siglaUFRepresentacao, :situacaoExercicio, :dataInicio, :dataFim,
      :idCausaFimExercicio, :descricaoCausaFimExercicio, :idCadastroParlamentarAnterior
  end
end
