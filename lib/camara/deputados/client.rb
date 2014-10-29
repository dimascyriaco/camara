module Camara::Deputados::Client
  def obter_deputado(id)
    response = Camara.connection.get "/SitCamaraWS/Deputados.asmx/ObterDetalhesDeputado?ideCadastro=#{id}&numLegislatura="
    data = Nokogiri::XML response.body
    Camara::Deputados::Deputado.new data.xpath('//Deputado')
  end

  def obter_deputados
    response = Camara.connection.get "/SitCamaraWS/Deputados.asmx/ObterDeputados"
    data = Nokogiri::XML response.body
    data.xpath('//deputado').map { |deputado| Camara::Deputados::Deputado.new(deputado) }
  end
end
