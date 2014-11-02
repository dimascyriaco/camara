require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'
require 'active_support/concern'

# O 'concern' XmlFields provê a possibiliade de se listar campos que serão extraidos
# do XML passado na inicialização e disponibilizados como attr_readers pela classe.
#
# @exemple
#   class Person
#     include Camara::XmlFields
#     fields :name, :phone
#   end
#
#   data = Nokogiri::XML "<person><name>Dimas Cyriaco</name><phone>9999-9999</phone></person>"
#
#   person = Person.new(data)
#   person.name  # => 'Dimas Cyriaco'
#   person.phone # => '9999-9999'
#
# XmlFields também aceita classes aninhadas.
#
# @exemple
#   class Address
#     include Camara::XmlFields
#     fields :street, :number
#   end
#
#   class Person
#     include Camara::XmlFields
#     fields :name, address: Address
#   end
#
#   data = Nokogiri::XML "<person><name>Dimas Cyriaco</name><address><street>Blah</street><number>999</number></address></person>"
#
#   person = Person.new(data)
#   person.name  # => 'Dimas Cyriaco'
#   person.phone # => '9999-9999'
#   person.address # => <#Address>
#   person.address.street # => 'Blah'
#   person.address.number # => '999'
#
# Também é possivel configurar campos que contenham um array.
#
# @example
#   class Hobby
#     include Camara::XmlFields
#     fields :name
#   end
#
#   class Person
#     include Camara::XmlFields
#     fields :name, hobbies: [Hobby]
#   end
#
#   data = Nokogiri::XML "<person><name>Dimas Cyriaco</name><hobbies><hobby><name>Football</name></hobby></hobbies></person>"
#
#   person = Person.new(data)
#   person.hobbies # => [<#Hobby name="Football">]
#
module Camara::XmlFields
  extend ActiveSupport::Concern

  included do
    def fields
      self.class.xml_fields
    end

    # @param [Nokogiri::XML::Element] data
    def initialize(data)
      Array(fields).each do |field_name|
        case field_name
        when String, Symbol
          value = data.css("/#{field_name}").text.presence || data.css("@#{field_name}").text.presence rescue nil
          instance_variable_set "@#{field_name.to_s.underscore}", value
        when Hash
          field_name.keys.each do |key|
            if field_name[key].is_a? Array
              objects = data.css("#{key.to_s.singularize}").map do |data|
                field_name[key].first.new(data)
              end
              instance_variable_set "@#{key.to_s.underscore}", objects
            else
              instance_variable_set "@#{key.to_s.underscore}", field_name[key].new(data.css("/#{key}"))
            end
          end
        end
      end
    end
  end

  module ClassMethods
    attr_reader :xml_fields

    # @param Array<String, Symbol, Hash> args
    def fields(*args)
      @xml_fields = args

      @xml_fields.each do |field_name|
        case field_name
        when String, Symbol
          attr_reader field_name.to_s.underscore
        when Hash
          field_name.keys.each do |key|
            attr_reader key.to_s.underscore
          end
        end
      end
    end
  end
end
