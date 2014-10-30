# O 'concern' XmlFields provê a possibiliade de se listar campos que serão extraidos
# do XML passado na inicialização e disponibilizados como attr_readers pela classe.
#
# @exemple
#   class Person
#     include Camara::XmlFields
#     fields :name, :phone
#   end
#
#   data = "<person><name>Dimas Cyriaco</name><phone>9999-9999</phone></person>"
#
#   person = Person.new(data)
#   person.name  # => 'Dimas Cyriaco'
#   person.phone # => '9999-9999'
#
module Camara::XmlFields
  extend ActiveSupport::Concern

  included do
    def fields
      self.class.xml_fields
    end

    def initialize(data)
      fields.each do |field_name|
        instance_eval "@#{field_name.to_s.underscore} = data.css('/#{field_name}').text"
      end
    end
  end

  module ClassMethods
    attr_reader :xml_fields

    def fields(*args)
      @xml_fields = args

      @xml_fields.each do |field_name|
        attr_reader field_name.to_s.underscore
      end
    end
  end
end
