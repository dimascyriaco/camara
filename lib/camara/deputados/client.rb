module Camara::Deputados::Client
  def obter_deputado(id)
    response = Camara.connection.get "/SitCamaraWS/Deputados.asmx/ObterDetalhesDeputado?ideCadastro=#{id}&numLegislatura="
    data = Nokogiri::XML response.body
    Camara::Deputados::Deputado.new data.xpath('//Deputado')
  end

  def obter_deputados
    # /SitCamaraWS/Deputados.asmx/ObterDeputados
  end
end
