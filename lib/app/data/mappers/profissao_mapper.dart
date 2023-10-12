import 'package:dson_adapter/dson_adapter.dart';
import 'package:poc_realm/app/domain/entities/profissao.dart';
import 'package:realm/realm.dart';

import '../models/profissao_model.dart';

extension ProfissaoMapper on Profissao {
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
    };
  }

  Profissao fromJson(Map<String, dynamic> json) {
    const dson = DSON();

    return dson.fromJson<Profissao>(json, Profissao.new);
  }

  ProfissaoModel toModel() {
    return ProfissaoModel(id ?? Uuid.v1().toString(), nome);
  }
}

extension ProfissaoModelAdapter on ProfissaoModel {
  Profissao toDomain() {
    return Profissao(id: id, nome: nome);
  }
}
