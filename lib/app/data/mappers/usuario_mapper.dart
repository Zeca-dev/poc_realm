import 'package:dson_adapter/dson_adapter.dart';
import 'package:poc_realm/app/data/mappers/profissao_mapper.dart';
import 'package:poc_realm/app/domain/entities/profissao.dart';
import 'package:poc_realm/app/domain/entities/usuario.dart';
import 'package:realm/realm.dart';

import '../models/usuario_model.dart';

extension UsuarioMapper on Usuario {
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'idade': idade,
      'profissoes': profissoes,
    };
  }

  Usuario fromJson(Map<String, dynamic> json) {
    const dson = DSON();

    return dson.fromJson(
      json,
      inner: {
        'profissoes': ListParam<Profissao>(Profissao.new),
      },
      Usuario.new,
    );
  }

  UsuarioModel toModel() {
    return UsuarioModel(id ?? Uuid.v1().toString(), nome, idade,
        profissoes: profissoes.map((e) => e.toModel()));
  }
}

extension UsuarioModelAdapter on UsuarioModel {
  Usuario toDomain() {
    return Usuario(
        id: id, nome: nome, idade: idade, profissoes: profissoes.map((e) => e.toDomain()).toList());
  }
}
