import 'package:realm/realm.dart';

part 'profissao_model.realm.dart';

@RealmModel()
class $ProfissaoModel {
  @PrimaryKey()
  late String id;
  late String nome;
}
