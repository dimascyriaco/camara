require 'spec_helper'

describe Camara::Deputados::Client do
  it "#obter_deputados" do
    deputados = VCR.use_cassette('camara/deputados/obter_deputados') do
      Camara::Deputados.obter_deputados
    end
    expect(deputados).not_to be_empty
    expect(deputados).to have_at_least(1).items
    expect(deputados.first).to an_instance_of(Camara::Deputados::Deputado)
  end

  it "#obter_deputado" do
    deputado = VCR.use_cassette('camara/deputados/obter_deputado_178387') do
      Camara::Deputados.obter_deputado('178387')
    end
    expect(deputado.nome).to eq('FRANCISCO DE ASSIS NUNES')
  end
end
