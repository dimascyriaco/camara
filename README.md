[![Code Climate](https://codeclimate.com/github/dimascyriaco/camara/badges/gpa.svg)](https://codeclimate.com/github/dimascyriaco/camara)
[![Build Status](https://travis-ci.org/dimascyriaco/camara.svg?branch=master)](https://travis-ci.org/dimascyriaco/camara)
[![Coverage Status](https://coveralls.io/repos/dimascyriaco/camara/badge.png?branch=master)](https://coveralls.io/r/dimascyriaco/camara?branch=master)

# Camara

Camara é uma biblioteca para acesso aos webservices da Camera dos Deputados.

## Instalação

Adicione esta linha aos seu Gemfile:

    gem 'camara'

E execute:

    $ bundle

Ou instale você mesmo:

    $ gem install camara

## Uso

```ruby
deputados = Camara::Deputados.obter_deputados # => [<Deputado>, <Deputado>, ...]
deputado = Camara::Deputados.obter_detalhes_deputado(deputados.first.id) # => <Deputado>
deputado.nome # => "Fulano de Tal"
```

## Contribuindo

1. Faça um fork do projeto
2. Crie um branch para a sua feature (`git checkout -b minha-nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adicionada nova feature'`)
4. Faça push para o branch (`git push origin minha-nova-feature`)
5. Crie um Pull Request
