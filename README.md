# Camara

É uma biblioteca para acesso aos webservices da Camera dos Deputados.

## Instalação

Adicione esta linha aos seu Gemfile:

    gem 'camara'

E execute:

    $ bundle

Ou instale você mesmo:

    $ gem install camara

## Uso

    deputados = Camara::Deputados.obter_deputados # => [<Deputado>, <Deputado>, ...]
    deputado = Camara::Deputados.obter_deputado(deputados.first.id) # => <Deputado>
    deputado.nome # => 'Fulano de Tal'

## Contributing

1. Faça um fork do projeto ( https://github.com/[my-github-username]/camara/fork )
2. Crie um branch para a sua feature (`git checkout -b minha-nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adicionada nova feature'`)
4. Faça push para o branch (`git push origin minha-nova-feature`)
5. Crie um Pull Request
