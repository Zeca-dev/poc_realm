import 'package:realm/realm.dart';

import '../models/profissao_model.dart';
import '../models/usuario_model.dart';

var realmConfig = Configuration.local(
  [UsuarioModel.schema, ProfissaoModel.schema],
  schemaVersion: 1,
);
