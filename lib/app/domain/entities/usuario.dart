// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:poc_realm/app/domain/entities/profissao.dart';

enum EstadoCivil {
  solteiro(nome: 'solteiro'),
  casado(nome: 'casado');

  const EstadoCivil({required this.nome});
  final String nome;

  //Esse método é necessário para fazer os parsers de valores para o fromJson
  static EstadoCivil getValue(String nome) =>
      values.firstWhere((e) => e.nome == nome, orElse: () => EstadoCivil.solteiro);
}

class Usuario {
  final String? id;
  final String nome;
  final int idade;
  final List<int> numeros;

  final EstadoCivil estadoCivil;

  final List<Profissao> profissoes;

  Usuario({
    this.id,
    required this.nome,
    required this.idade,
    required this.numeros,
    required this.estadoCivil,
    required this.profissoes,
  });

  Usuario copyWith({
    String? id,
    String? nome,
    int? idade,
    List<int>? numeros,
    EstadoCivil? estadoCivil,
    List<Profissao>? profissoes,
  }) {
    return Usuario(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      idade: idade ?? this.idade,
      numeros: numeros ?? this.numeros,
      estadoCivil: estadoCivil ?? this.estadoCivil,
      profissoes: profissoes ?? this.profissoes,
    );
  }

  @override
  String toString() {
    return 'Usuario(id: $id, nome: $nome, idade: $idade, numeros: $numeros, estadoCivil: $estadoCivil, profissoes: $profissoes)';
  }
}
