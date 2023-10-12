// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:poc_realm/app/data/mappers/usuario_mapper.dart';
import 'package:poc_realm/app/domain/entities/usuario.dart';
import 'package:poc_realm/app/domain/repositories/usuario_repository_interface.dart';
import 'package:realm/realm.dart';

import '../models/usuario_model.dart';

class UsuarioRealmRepository implements UsuarioRepository {
  final Realm realm;

  UsuarioRealmRepository({
    required this.realm,
  });
  @override
  Future<List<Usuario>> buscarUsuarios() async {
    return realm.all<UsuarioModel>().map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> salvarUsuario(Usuario usuario) async {
    realm.write(() {
      realm.add(usuario.toModel());
    });
  }

  @override
  Future<void> atualizarUsuario(Usuario usuario) async {
    realm.write(() {
      realm.add(usuario.toModel(), update: true);
    });
  }

  @override
  Future<void> deletarUsuario(Usuario usuario) async {
    final usuarioModel = realm.find<UsuarioModel>(usuario.id);
    realm.write(() {
      realm.delete<UsuarioModel>(usuarioModel!);
    });
  }
}
