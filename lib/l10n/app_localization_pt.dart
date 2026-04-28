// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get homePageTitle => 'Minha Lista';

  @override
  String completedTitles(Object completed, Object total) {
    return '$completed/$total títulos assistidos!';
  }

  @override
  String get clearAll => 'Limpar Tudo';

  @override
  String get newTitle => 'Novo Título...';

  @override
  String titleRemoved(Object title) {
    return 'O título \"$title\" foi removido com sucesso!';
  }

  @override
  String get actionUndone => 'Ação desfeita!';

  @override
  String get clearAllConfirmation => 'Limpar Tudo?';

  @override
  String get noTitles => 'Você não possui títulos cadastrados!';

  @override
  String get close => 'Fechar';

  @override
  String get delete => 'Deletar';

  @override
  String get edit => 'Editar';

  @override
  String get clearAllConfirmationDialog => 'Limpar Tudo?';

  @override
  String get confirmDeleteAll =>
      'Tem certeza que deseja apagar todos os títulos?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get addNewTitle => 'Novo Título...';

  @override
  String get title => 'Título';

  @override
  String get availableOn => 'Disponível em...';

  @override
  String get requiredField => 'Campo obrigatório!';

  @override
  String get required => 'Obrigatório!';

  @override
  String get add => 'Adicionar';

  @override
  String get selectStreamingAndAccess =>
      'Selecione o streaming e o tipo de acesso';

  @override
  String get back => 'Voltar';

  @override
  String get chooseAtLeastOne => 'Escolha ao menos um!';

  @override
  String get confirm => 'Confirmar';

  @override
  String get undo => 'Desfazer';

  @override
  String get selectAccess => 'Selecione o acesso';

  @override
  String get buyRent => 'Compra/Aluguel';

  @override
  String get free => 'Grátis';

  @override
  String get signature => 'Assinatura';

  @override
  String get selectCategory => 'Selecione a categoria';

  @override
  String get anime => 'Anime';

  @override
  String get cartoon => 'Desenho Animado';

  @override
  String get documentary => 'Documentário';

  @override
  String get filmedTheater => 'Teatro Filmado';

  @override
  String get movie => 'Filme';

  @override
  String get machinima => 'Machinima';

  @override
  String get miniseries => 'Minissérie';

  @override
  String get animatedComic => 'Quadrinho Animado';

  @override
  String get musicVideo => 'Videoclipe';

  @override
  String get realityShow => 'Reality Show';

  @override
  String get serial => 'Seriado';

  @override
  String get tvSeries => 'Série de TV';

  @override
  String get shortFilm => 'Curta-metragem';

  @override
  String get soapOpera => 'Novela';

  @override
  String get special => 'Especial';

  @override
  String get tvProgram => 'Programa de TV';

  @override
  String get videocasts => 'Videocasts';

  @override
  String get webSeries => 'Websérie';

  @override
  String get all => 'Tudo';

  @override
  String get watched => 'Assistidos';

  @override
  String get unwatched => 'Não Assistidos';

  @override
  String get category => 'Categoria';

  @override
  String get streaming => 'Streaming';

  @override
  String get accessMode => 'Modo de Acesso';

  @override
  String get creationDate => 'Data de criação';

  @override
  String get alphabeticalOrder => 'Ordem alfabética';

  @override
  String get selectStreaming => 'Selecione o streaming';

  @override
  String get other => 'Outro';

  @override
  String get filterBy => 'Filtrar por:';

  @override
  String get editTitle => 'Editar Título...';

  @override
  String get save => 'Salvar';

  @override
  String get appSettings => 'Configurações';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get appTheme => 'Tema';

  @override
  String get backupSecurity => 'Segurança dos Dados';

  @override
  String get backupSecurityInfo =>
      'O app salva tudo localmente. Use as opções abaixo para não perder dados ao trocar de dispositivo.';

  @override
  String get backupExport => 'Exportar seus dados';

  @override
  String get downloadBackup => 'Baixar backup';

  @override
  String get shareBackup => 'Compartilhar backup';

  @override
  String get importBackup => 'Carregar backup';

  @override
  String get replaceData => 'Substitui todos os dados atuais';

  @override
  String get confirmImport => 'Confirmar Importação';

  @override
  String get confirmImportMsg =>
      'Isso apagará todos os dados atuais e os substituirá pelo backup. Continuar?';

  @override
  String get backupSaved => 'Backup salvo!';

  @override
  String get backupShared => 'Backup compartilhado!';

  @override
  String get backupError => 'Erro ao gerar backup';

  @override
  String get importSuccess => 'Backup importado com sucesso!';

  @override
  String get importError => 'Erro ao importar backup';

  @override
  String get updatedAt => 'Atualização';

  @override
  String get behavior => 'Comportamento';

  @override
  String get confirmDeleteTitle => 'Confirmar antes de deletar';

  @override
  String get confirmDeleteSubtitle =>
      'Exibir diálogo de confirmação antes de remover um título';

  @override
  String get search => 'Procurar';

  @override
  String get showCompletedOnHome => 'Mostrar concluídos no início';

  @override
  String get showCompletedOnHomeSubtitle =>
      'Exibir títulos assistidos na aba principal';
}
