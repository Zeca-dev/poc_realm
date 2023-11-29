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
      'estadoCivil': estadoCivil,
      'profissoes': profissoes,
    };
  }

  static Usuario fromJson(Map<String, dynamic> json) {
    const dson = DSON();

    return dson.fromJson(
      json,
      Usuario.new,
      inner: {
        'profissoes': ListParam<Profissao>(Profissao.new),
      },
      resolvers: [
        //Resolver para o estado civil
        (key, value) => (key == 'estadoCivil' && value != null) ? EstadoCivil.getValue(value) : value,
        //Resolver para a lista de int
        (key, value) => (key == 'numeros' && value != null) ? value as List<int> : value
      ],
    );
  }

  UsuarioModel toModel() {
    return UsuarioModel(id ?? Uuid.v1().toString(), nome, idade, estadoCivil.nome,
        numeros: numeros, profissoes: profissoes.map((e) => e.toModel()));
  }
}

extension UsuarioModelAdapter on UsuarioModel {
  Usuario toDomain() {
    return Usuario(
        id: id,
        nome: nome,
        idade: idade,
        numeros: numeros,
        estadoCivil: EstadoCivil.getValue(estadoCivil),
        profissoes: profissoes.map((e) => e.toDomain()).toList());
  }
}
