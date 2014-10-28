require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

require 'camara'

describe 'Camara' do
  it '#listar_tipos_orgaos' do
  	list = Camara::Orgaos.listar_tipos_orgaos
  	list[0..37].must_equal("<?xml version=\"1.0\" encoding=\"utf-8\"?>")
  	list[56..99].must_equal("<tipoOrgao id=\"81000\" descricao=\"Bancada\" />")
  end

  it "#obter_deputado" do
  	deputado = Camara::Deputados.obter_deputado('178387')
  	deputado.nome.must_equal('FRANCISCO DE ASSIS NUNES')
  end
end
