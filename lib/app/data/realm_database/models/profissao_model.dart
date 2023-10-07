// part of 'usuario_model.dart';

import 'package:realm/realm.dart';

part 'profissao_model.g.dart';

@RealmModel()
class $ProfissaoModel {
  @PrimaryKey()
  late String id;
  late String nome;
}
