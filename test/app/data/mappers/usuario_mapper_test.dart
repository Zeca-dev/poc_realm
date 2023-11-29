import 'package:flutter_test/flutter_test.dart';
import 'package:poc_realm/app/data/mappers/usuario_mapper.dart';
import 'package:poc_realm/app/data/models/usuario_model.dart';
import 'package:poc_realm/app/domain/entities/profissao.dart';
import 'package:poc_realm/app/domain/entities/usuario.dart';

void main() {
  final json = {
    'id': '1',
    'idade': 41,
    'nome': 'Zeca',
    'numeros': [1, 2, 3, 4, 5, 6],
    'estadoCivil': 'solteiro',
    'profissoes': [
      {'id': '1', 'nome': 'Desenvolvedor'},
      {'id': '2', 'nome': 'Programador'},
    ],
  };

  final usuario = Usuario(
    nome: 'Zeca',
    idade: 41,
    numeros: [1, 2, 3, 4, 5, 6],
    estadoCivil: EstadoCivil.casado,
    profissoes: [Profissao(id: '1', nome: 'Programador'), Profissao(id: '2', nome: 'Desenvolvedor')],
  );

  final model = UsuarioModel('1', 'Zeca', 41, 'casado');

  group('[Mappers Tests] ', () {
    test('Deve retornar um Usuario a partir de um Json', () {
      final usuario = UsuarioMapper.fromJson(json);

      expect(usuario, isA<Usuario>());
      print('$usuario \n');
    });

    test('Deve retornar um Json a partir de um Usuario', () {
      final usuarioJson = usuario.toJson();

      expect(usuarioJson, isA<Map<String, dynamic>>());
      print('$usuarioJson \n');
    });

    test('Deve retornar um UsuarioModel a partir de um Usuario', () {
      final usuarioModel = usuario.toModel();

      expect(usuarioModel, isA<UsuarioModel>());
      print('$usuarioModel \n');
    });

    test('Deve retornar um Usuario a partir de um UsuarioModel', () {
      final usuario = model.toDomain();

      expect(usuario, isA<Usuario>());
      print('$usuario \n');
    });
  });
}
