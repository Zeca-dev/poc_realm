import 'package:flutter_test/flutter_test.dart';
import 'package:poc_realm/app/data/mappers/usuario_mapper.dart';
import 'package:poc_realm/app/domain/entities/usuario.dart';

void main() {
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
    print(usuario);

    expect(usuario, isA<Usuario>());
  });
}
