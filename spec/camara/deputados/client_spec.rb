require 'spec_helper'

describe Camara::Deputados::Client do
  it "#obter_deputados" do
    deputados = Camara::Deputados.obter_deputados
    expect(deputados).not_to be_empty
    expect(deputados).to have_at_least(1).items
    expect(deputados.first).to an_instance_of(Camara::Deputados::Deputado)
  end

  it "#obter_deputado" do
    deputado = Camara::Deputados.obter_deputado('178387')
    expect(deputado.nome).to eq('FRANCISCO DE ASSIS NUNES')
  end
end
