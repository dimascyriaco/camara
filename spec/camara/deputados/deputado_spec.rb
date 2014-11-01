require 'spec_helper'

describe Camara::Deputados::Deputado do
  it 'has fields' do
    deputado = Camara::Deputados::Deputado.new(Nokogiri::XML(''))
    expect(deputado).to have_fields :email, :nomeProfissao, :dataNascimento, :dataFalecimento, :ufRepresentacaoAtual,
      :situacaoNaLegislaturaAtual, :ideCadastro, :idParlamentarDeprecated, :nomeParlamentarAtual, :nomeCivil, :sexo,
      :partidoAtual, :gabinete, :comissoes, :cargosComissoes, :periodosExercicio, :historicoNomeParlamentar,
      :filiacoesPartidarias, :historicoLider, :condicao, :matricula, :idParlamentar, :nome, :nomeParlamentar,
      :urlFoto, :uf, :partido, :anexo, :fone, :numLegislatura

    expect(deputado).to have_field :partidoAtual, as_class: Camara::Deputados::Partido
  end
end
