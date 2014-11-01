require 'spec_helper'

describe Camara::Deputados::Partido do
  it 'has fields' do
    partido = Camara::Deputados::Partido.new(Nokogiri::XML(''))
    expect(partido).to have_fields :idPartido, :sigla, :nome
  end
end
