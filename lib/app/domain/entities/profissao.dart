// ignore_for_file: public_member_api_docs, sort_constructors_first

class Profissao {
  final String? id;
  final String nome;

  Profissao({
    this.id,
    required this.nome,
  });

  Profissao copyWith({
    String? id,
    String? nome,
  }) {
    return Profissao(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }

  @override
  String toString() => 'Profissao(id: $id, nome: $nome)';
}
