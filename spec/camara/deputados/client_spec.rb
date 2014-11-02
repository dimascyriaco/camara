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

  describe "#obter_detalhes_deputado" do
    it "#obter_detalhes_deputado" do
      xml_element = double 'XML'
      allow(Nokogiri).to receive(:XML).and_return(double(at_css: xml_element))
      expect(Camara::Deputados::Deputado).to receive(:new).with(xml_element)
      deputado = VCR.use_cassette('camara/deputados/obter_deputado_178387') do
        Camara::Deputados.obter_detalhes_deputado('178387')
      end
    end

    it 'returns nil if the id is invalid' do
      deputado = VCR.use_cassette('camara/deputados/obter_deputado_9999') do
        Camara::Deputados.obter_detalhes_deputado('9999')
      end

      expect(deputado).to be_nil
    end
  end

  describe '#obter_partidos_cd' do
    it "retorna um array de Partidos" do
      xml_element = double 'XML'
      allow(Nokogiri).to receive(:XML).and_return(double(css: [xml_element]))
      expect(Camara::Deputados::Partido).to receive(:new).with(xml_element)
      deputado = VCR.use_cassette('camara/deputados/obter_partidos_cd') do
        Camara::Deputados.obter_partidos_cd
      end
    end

    it "does something" do
      partidos = VCR.use_cassette('camara/deputados/obter_partidos_cd') do
        Camara::Deputados.obter_partidos_cd
      end
      partido = partidos.first

      expect(partidos).not_to           be_empty
      expect(partido).to                be_an_instance_of(Camara::Deputados::Partido)
      expect(partido.sigla_partido).to  eq('PEN')
      expect(partido.id_partido).to     eq('PEN')
      expect(partido.nome_partido).to   eq('Partido Ecológico Nacional')
      expect(partido.data_criacao).to   be_nil
      expect(partido.data_extincao).to  be_nil
    end
  end

  describe '#obter_lideres_bancadas' do
    it 'retorna as bancadas e seus líderes' do
      bancadas = VCR.use_cassette('camara/deputados/obter_lideres_bancadas') do
        Camara::Deputados.obter_lideres_bancadas
      end
      bancada = bancadas.first

      expect(bancadas).not_to  be_empty
      expect(bancada).to       be_an_instance_of(Camara::Deputados::Bancada)
      expect(bancada.sigla).to eq('PT')
      expect(bancada.nome).to  eq('Partido dos Trabalhadores')
      expect(bancada.lider).to be_an_instance_of(Camara::Deputados::Deputado)
      expect(bancada.lider.nome).to eq('VICENTINHO')
      expect(bancada.vice_lideres).not_to be_empty
      expect(bancada.vice_lideres.first).to be_an_instance_of(Camara::Deputados::Deputado)
      expect(bancada.vice_lideres.first.nome).to eq('ALESSANDRO MOLON')
    end
  end
end
