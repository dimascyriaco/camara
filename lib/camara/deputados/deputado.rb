class Camara::Deputados::Deputado
  attr_reader :nome

  def initialize(data)
    @nome = data.xpath('//nomeCivil').text
  end
end
