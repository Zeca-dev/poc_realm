import 'package:flutter_test/flutter_test.dart';
import 'package:poc_realm/app/data/mappers/usuario_mapper.dart';
import 'package:poc_realm/app/domain/entities/profissao.dart';
import 'package:poc_realm/app/domain/entities/usuario.dart';

void main() {
  group('[Mappers Tests] ', () {
    test('Deve retornar um Usuario a partir de um Json', () {
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

      final usuario = UsuarioMapper.fromJson(json);

      print('$usuario \n');

      expect(usuario, isA<Usuario>());
    });

    test('Deve retornar um Json a partir de um Usuario', () {
      final usuario = Usuario(
        nome: 'Zeca',
        idade: 41,
        numeros: [1, 2, 3, 4, 5, 6],
        estadoCivil: EstadoCivil.casado,
        profissoes: [Profissao(id: '1', nome: 'Programador'), Profissao(id: '2', nome: 'Desenvolvedor')],
      );

      final usuarioJson = usuario.toJson();

      print('$usuarioJson \n');

      expect(usuarioJson, isA<Map<String, dynamic>>());
    });
  });
}
