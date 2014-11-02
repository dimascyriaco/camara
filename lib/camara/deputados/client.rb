module Camara::Deputados::Client
  def obter_deputados
    response = Camara.connection.get "/SitCamaraWS/Deputados.asmx/ObterDeputados"
    data = Nokogiri::XML clean_xml(response.body)
    data.css('deputado').map { |deputado| Camara::Deputados::Deputado.new(deputado) }
  end

  def obter_detalhes_deputado(id)
    response = Camara.connection.get "/SitCamaraWS/Deputados.asmx/ObterDetalhesDeputado?ideCadastro=#{id}&numLegislatura="

    data = Nokogiri::XML(clean_xml(response.body)).at_css('Deputado')
    Camara::Deputados::Deputado.new data if data
  end

  def obter_partidos_cd
    response = Camara.connection.get "/SitCamaraWS/Deputados.asmx/ObterPartidosCD"
    data = Nokogiri::XML clean_xml(response.body)
    data.css('partido').map { |deputado| Camara::Deputados::Partido.new(deputado) }
  end

  def obter_lideres_bancadas
    response = Camara.connection.get "/SitCamaraWS/Deputados.asmx/ObterLideresBancadas"
    data = Nokogiri::XML clean_xml(response.body)
    data.css('bancada').map { |bancada| Camara::Deputados::Bancada.new(bancada) }
  end

  def obter_partidos_bloco_cd(id=nil, legislatura=nil)
    response = Camara.connection.get "/SitCamaraWS/Deputados.asmx/ObterPartidosBlocoCD?numLegislatura=#{legislatura}&idBloco=#{id}"
    data = Nokogiri::XML clean_xml(response.body)
    data.css('bloco').map { |bloco| Camara::Deputados::Bloco.new(bloco) }
  end

  private
    def clean_xml(xml)
      xml.gsub(/\r\n\s*/, '')
    end
end
