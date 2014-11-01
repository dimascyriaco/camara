require 'spec_helper'

describe Camara::Deputados::Comissao do
  it 'has fields' do
    comissao = Camara::Deputados::Comissao.new(Nokogiri::XML(''))
    expect(comissao).to have_fields :idOrgaoLegislativoCD, :siglaComissao, :nomeComissao, :condicaoMembro, :dataEntrada,
      :dataSaida
  end
end
