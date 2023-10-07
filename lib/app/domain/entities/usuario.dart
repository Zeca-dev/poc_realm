// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:poc_realm/app/domain/entities/profissao.dart';

class Usuario {
  final String? id;
  final String nome;
  final int idade;

  final List<Profissao> profissoes;
  Usuario({
    this.id,
    required this.nome,
    required this.idade,
    required this.profissoes,
  });

  Usuario copyWith({
    String? id,
    String? nome,
    int? idade,
    List<Profissao>? profissoes,
  }) {
    return Usuario(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      idade: idade ?? this.idade,
      profissoes: profissoes ?? this.profissoes,
    );
  }
}
