import 'package:realm/realm.dart';

import 'profissao_model.dart';

part 'usuario_model.g.dart';

@RealmModel()
class $UsuarioModel {
  @PrimaryKey()
  late String id;
  late String nome;
  late int idade;

  late List<$ProfissaoModel> profissoes;
}
