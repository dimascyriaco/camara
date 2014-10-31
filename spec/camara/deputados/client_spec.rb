require 'spec_helper'

describe Camara::Deputados::Client do
  it "#obter_deputados" do
    deputados = VCR.use_cassette('camara/deputados/obter_deputados') do
      Camara::Deputados.obter_deputados
    end
    expect(deputados).not_to be_empty
    expect(deputados).to have_at_least(1).items
    expect(deputados.first).to an_instance_of(Camara::Deputados::Deputado)
    expect(deputados.first.nome).to eq('FRANCISCO DE ASSIS NUNES')
  end

  it "#obter_deputado" do
    deputado = VCR.use_cassette('camara/deputados/obter_deputado_178387') do
      Camara::Deputados.obter_deputado('178387')
    end

    expect(deputado.num_legislatura).to               eq('54')
    expect(deputado.email).to                         eq('dep.franciscodeassis@camara.gov.br')
    expect(deputado.nome_profissao).to                be_nil
    expect(deputado.data_nascimento).to               eq('08/09/1962')
    expect(deputado.data_falecimento).to              be_nil
    expect(deputado.uf_representacao_atual).to        eq('SC')
    expect(deputado.situacao_na_legislatura_atual).to eq('Em Exercício')
    expect(deputado.ide_cadastro).to                  eq('178387')
    expect(deputado.id_parlamentar_deprecated).to     eq('10277')
    expect(deputado.nome_parlamentar_atual).to        eq('FRANCISCO DE ASSIS')
    expect(deputado.nome_civil).to                    eq('FRANCISCO DE ASSIS NUNES')
    expect(deputado.sexo).to                          eq('M')
    # expect(deputado.partido_atual).to                 eq('54')
    # expect(deputado.gabinete).to                      eq('54')
    # expect(deputado.comissoes).to                     eq('54')
    expect(deputado.cargos_comissoes).to              be_nil
    # expect(deputado.periodos_exercicio).to            eq('54')
    expect(deputado.historico_nome_parlamentar).to    be_nil
    expect(deputado.filiacoes_partidarias).to         be_nil
    expect(deputado.historico_lider).to               be_nil
  end
end
