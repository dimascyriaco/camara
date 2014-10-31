require 'spec_helper'

class Address
  include Camara::XmlFields
  fields :street, :number
end

class Person
  include Camara::XmlFields
  fields :name, :phone, address: Address
end

describe Camara::XmlFields do
  it 'guarda os "fields"' do
    expect(Person.instance_variable_get('@xml_fields')).to eq([:name, :phone, { address: Address }])
    expect(Person.new(Nokogiri::XML('')).fields).to eq([:name, :phone, { address: Address }])
  end

  it 'parseia o xml e armazena os campos designados' do
    xml = Nokogiri::XML('<name>Dimas Cyriaco</name>')
    person = Person.new xml
    expect(person.name).to eq('Dimas Cyriaco')
    expect(person.phone).to be_nil
  end

  it 'parseia objetos aninhados' do
    xml = Nokogiri::XML('<address><street>Blah</street><number>999</number></address>')
    person = Person.new xml
    expect(person.address).to be_an_instance_of(Address)
    expect(person.address.street).to eq('Blah')
    expect(person.address.number).to eq('999')
  end
end
