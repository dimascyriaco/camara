require 'spec_helper'

describe Camara::Deputados::Bloco do
  it 'has fields' do
    bloco = Camara::Deputados::Bloco.new(Nokogiri::XML(''))
    expect(bloco).to have_fields :idBloco, :nomeBloco, :siglaBloco, :dataCriacaoBloco, :dataExtincaoBloco
  end
end
