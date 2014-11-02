class Camara::Deputados::Bancada
  include Camara::XmlFields
  fields :sigla, :nome, lider: Camara::Deputados::Deputado, vice_lideres: [Camara::Deputados::Deputado]
end
