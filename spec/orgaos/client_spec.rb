require 'spec_helper'

describe Camara::Orgaos::Client do
  it '#listar_tipos_orgaos' do
    list = Camara::Orgaos.listar_tipos_orgaos
    expect(list[0..37]).to eq("<?xml version=\"1.0\" encoding=\"utf-8\"?>")
    expect(list[56..99]).to eq("<tipoOrgao id=\"81000\" descricao=\"Bancada\" />")
  end
end
