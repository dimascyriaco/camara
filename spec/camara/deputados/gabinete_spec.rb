require 'spec_helper'

describe Camara::Deputados::Gabinete do
  it 'has fields' do
    gabinete = Camara::Deputados::Gabinete.new(Nokogiri::XML(''))
    expect(gabinete).to have_fields :numero, :anexo, :telefone
  end
end
