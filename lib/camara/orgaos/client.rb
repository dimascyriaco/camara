module Camara::Orgaos::Client
  def listar_tipos_orgaos
  	response = Camara.connection.get '/SitCamaraWS/Orgaos.asmx/ListarTiposOrgaos'
  	data = Nokogiri::XML response.body
  	response.body
  end
end
