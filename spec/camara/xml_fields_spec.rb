require 'spec_helper'

class Address
  include Camara::XmlFields
  fields :street, :number
end

class Hobby
  include Camara::XmlFields
  fields :name
end

class Person
  include Camara::XmlFields
  fields :name, :phone, addressData: Address, hobbies: [Hobby]
end

describe Camara::XmlFields do
  it 'guarda os "fields"' do
    expect(Person.instance_variable_get('@xml_fields')).to eq([:name, :phone, { addressData: Address, hobbies: [Hobby] }])
    expect(Person.new(Nokogiri::XML('')).fields).to eq([:name, :phone, { addressData: Address, hobbies: [Hobby] }])
  end

  it 'parseia o xml e armazena os campos designados' do
    xml = Nokogiri::XML('<name>Dimas Cyriaco</name>')
    person = Person.new xml
    expect(person.name).to eq('Dimas Cyriaco')
    expect(person.phone).to be_nil
  end

  it 'parseia objetos aninhados' do
    xml = Nokogiri::XML('<addressData><street>Blah</street><number>999</number></address>')
    person = Person.new xml
    expect(person.address_data).to be_an_instance_of(Address)
    expect(person.address_data.street).to eq('Blah')
    expect(person.address_data.number).to eq('999')
  end

  it 'aceita array' do
    xml = Nokogiri::XML('<hobbies><hobby>Football</hobby><hobby>Video Games</hobby></hobbies>')
    person = Person.new xml
    expect(person.hobbies).not_to be_empty
    expect(person.hobbies).to have(2).items
    expect(person.hobbies.first).to be_an_instance_of(Hobby)
  end
end
