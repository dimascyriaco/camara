class Camara::Deputados::CargoComissao
  include Camara::XmlFields
  fields :idOrgaoLegislativoCD, :siglaComissao, :nomeComissao, :idCargo, :nomeCargo, :dataEntrada, :dataSaida
end
