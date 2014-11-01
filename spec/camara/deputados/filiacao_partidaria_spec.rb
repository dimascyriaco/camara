require 'spec_helper'

describe Camara::Deputados::FiliacaoPartidaria do
  it 'has fields' do
    filiacao_partidaria = Camara::Deputados::FiliacaoPartidaria.new(Nokogiri::XML(''))
    expect(filiacao_partidaria).to have_fields :idPartidoAnterior, :siglaPartidoAnterior, :nomePartidoAnterior,
      :idPartidoPosterior, :siglaPartidoPosterior, :nomePartidoPosterior, :dataFiliacaoPartidoPosterior
  end
end
