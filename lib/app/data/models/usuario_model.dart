import 'package:realm/realm.dart';

import 'profissao_model.dart';

part 'usuario_model.g.dart';

@RealmModel()
class $UsuarioModel {
  @PrimaryKey()
  late String id;
  late String nome;
  late int idade;
  late List<int> numeros;
  late String estadoCivil; //Tipos Enum devem ser salvos na base como um tipo primitivo (String, int, ...)

  late List<$ProfissaoModel> profissoes;
}
