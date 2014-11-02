require 'spec_helper'

describe Camara::Deputados::Bancada do
  it 'has fields' do
    bancada = Camara::Deputados::Bancada.new(Nokogiri::XML(''))
    expect(bancada).to have_fields :sigla, :nome
    expect(bancada).to have_field :lider, as_class: Camara::Deputados::Deputado
    expect(bancada).to have_field :vice_lideres, as_class: [Camara::Deputados::Deputado]
  end
end
