module Camara::Deputados::Client
  def obter_deputados
    response = Camara.connection.get "/SitCamaraWS/Deputados.asmx/ObterDeputados"
    data = Nokogiri::XML clean_xml(response.body)
    data.css('deputado').map { |deputado| Camara::Deputados::Deputado.new(deputado) }
  end

  def obter_deputado(id)
    response = Camara.connection.get "/SitCamaraWS/Deputados.asmx/ObterDetalhesDeputado?ideCadastro=#{id}&numLegislatura="

    data = Nokogiri::XML clean_xml(response.body)
    Camara::Deputados::Deputado.new data.at_css('Deputado')
  end

  private
    def clean_xml(xml)
      xml.gsub("\r\n", '').squeeze(' ')
    end
end
