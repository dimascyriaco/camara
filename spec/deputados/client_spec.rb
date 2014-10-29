require 'spec_helper'

describe Camara::Deputados::Client do
  it "#obter_deputado" do
    deputado = Camara::Deputados.obter_deputado('178387')
    expect(deputado.nome).to eq('FRANCISCO DE ASSIS NUNES')
  end
end
