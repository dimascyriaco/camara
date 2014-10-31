class Camara::Deputados::Deputado
  include Camara::XmlFields

  fields :email, :nomeProfissao, :dataNascimento, :dataFalecimento, :ufRepresentacaoAtual, :situacaoNaLegislaturaAtual,
         :ideCadastro, :idParlamentarDeprecated, :nomeParlamentarAtual, :nomeCivil, :sexo, :partidoAtual, :gabinete,
         :comissoes, :cargosComissoes, :periodosExercicio, :historicoNomeParlamentar, :filiacoesPartidarias,
         :historicoLider, :condicao, :matricula, :idParlamentar, :nome, :nomeParlamentar, :urlFoto, :uf, :partido,
         :anexo, :fone, :numLegislatura
end
