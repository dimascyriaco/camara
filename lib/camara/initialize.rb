require 'active_support/inflector'

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.singular 'comissoes', 'comissao'
  inflect.singular 'periodosExercicio', 'periodoExercicio'
  inflect.singular 'cargosComissoes', 'cargoComissoes'
  inflect.singular 'lideres', 'lider'
end
