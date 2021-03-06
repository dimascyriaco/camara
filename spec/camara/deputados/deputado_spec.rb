require 'spec_helper'

describe Camara::Deputados::Deputado do
  it 'has fields' do
    deputado = Camara::Deputados::Deputado.new(Nokogiri::XML(''))
    expect(deputado).to have_fields :email, :nomeProfissao, :dataNascimento, :dataFalecimento, :ufRepresentacaoAtual,
      :situacaoNaLegislaturaAtual, :ideCadastro, :idParlamentarDeprecated, :nomeParlamentarAtual, :nomeCivil, :sexo,
      :historicoNomeParlamentar, :historicoLider, :condicao, :matricula, :idParlamentar, :nome, :nomeParlamentar,
      :urlFoto, :uf, :partido, :anexo, :fone, :numLegislatura

    expect(deputado).to have_field :partidoAtual, as_class: Camara::Deputados::Partido
    expect(deputado).to have_field :gabinete, as_class: Camara::Deputados::Gabinete
    expect(deputado).to have_field :comissoes, as_class: [Camara::Deputados::Comissao]
    expect(deputado).to have_field :periodosExercicio, as_class: [Camara::Deputados::PeriodoExercicio]
    expect(deputado).to have_field :cargosComissoes, as_class: [Camara::Deputados::CargoComissao]
    expect(deputado).to have_field :filiacoesPartidarias, as_class: [Camara::Deputados::FiliacaoPartidaria]
  end
end
