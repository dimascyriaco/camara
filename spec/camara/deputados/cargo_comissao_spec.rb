require 'spec_helper'

describe Camara::Deputados::CargoComissao do
  it 'has fields' do
    cargo_comissao = Camara::Deputados::CargoComissao.new(Nokogiri::XML(''))
    expect(cargo_comissao).to have_fields :idOrgaoLegislativoCD, :siglaComissao, :nomeComissao, :idCargo, :nomeCargo,
      :dataEntrada, :dataSaida
  end
end
