require 'spec_helper'

describe Camara::Deputados::Client do
  it "#obter_deputados" do
    xml_element = double 'XML'
    allow(Nokogiri).to receive(:XML).and_return(double(css: [xml_element]))
    expect(Camara::Deputados::Deputado).to receive(:new).with(xml_element)
    deputados = VCR.use_cassette('camara/deputados/obter_deputados') do
      Camara::Deputados.obter_deputados
    end
  end

  it "#obter_deputado" do
    xml_element = double 'XML'
    allow(Nokogiri).to receive(:XML).and_return(double(at_css: xml_element))
    expect(Camara::Deputados::Deputado).to receive(:new).with(xml_element)
    deputado = VCR.use_cassette('camara/deputados/obter_deputado_178387') do
      Camara::Deputados.obter_deputado('178387')
    end
  end
end
