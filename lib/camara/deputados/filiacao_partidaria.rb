class Camara::Deputados::FiliacaoPartidaria
  include Camara::XmlFields
  fields :idPartidoAnterior, :siglaPartidoAnterior, :nomePartidoAnterior, :idPartidoPosterior, :siglaPartidoPosterior,
         :nomePartidoPosterior, :dataFiliacaoPartidoPosterior
end
