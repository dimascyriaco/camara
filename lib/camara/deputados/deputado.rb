class Camara::Deputados::Deputado
  include Camara::XmlFields

  fields :email, :nomeProfissao, :dataNascimento, :dataFalecimento, :ufRepresentacaoAtual, :situacaoNaLegislaturaAtual,
         :ideCadastro, :idParlamentarDeprecated, :nomeParlamentarAtual, :nomeCivil, :sexo,
         :historicoNomeParlamentar, :filiacoesPartidarias, :historicoLider, :condicao, :matricula, :idParlamentar,
         :nome, :nomeParlamentar, :urlFoto, :uf, :partido, :anexo, :fone, :numLegislatura,
         partidoAtual: Camara::Deputados::Partido, gabinete: Camara::Deputados::Gabinete,
         comissoes: [Camara::Deputados::Comissao], periodosExercicio: [Camara::Deputados::PeriodoExercicio],
         cargosComissoes: [Camara::Deputados::CargoComissao]
end
