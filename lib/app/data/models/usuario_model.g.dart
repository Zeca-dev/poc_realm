// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class UsuarioModel extends $UsuarioModel
    with RealmEntity, RealmObjectBase, RealmObject {
  UsuarioModel(
    String id,
    String nome,
    int idade,
    String estadoCivil, {
    Iterable<int> numeros = const [],
    Iterable<ProfissaoModel> profissoes = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'nome', nome);
    RealmObjectBase.set(this, 'idade', idade);
    RealmObjectBase.set(this, 'estadoCivil', estadoCivil);
    RealmObjectBase.set<RealmList<int>>(
        this, 'numeros', RealmList<int>(numeros));
    RealmObjectBase.set<RealmList<ProfissaoModel>>(
        this, 'profissoes', RealmList<ProfissaoModel>(profissoes));
  }

  UsuarioModel._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get nome => RealmObjectBase.get<String>(this, 'nome') as String;
  @override
  set nome(String value) => RealmObjectBase.set(this, 'nome', value);

  @override
  int get idade => RealmObjectBase.get<int>(this, 'idade') as int;
  @override
  set idade(int value) => RealmObjectBase.set(this, 'idade', value);

  @override
  RealmList<int> get numeros =>
      RealmObjectBase.get<int>(this, 'numeros') as RealmList<int>;
  @override
  set numeros(covariant RealmList<int> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get estadoCivil =>
      RealmObjectBase.get<String>(this, 'estadoCivil') as String;
  @override
  set estadoCivil(String value) =>
      RealmObjectBase.set(this, 'estadoCivil', value);

  @override
  RealmList<ProfissaoModel> get profissoes =>
      RealmObjectBase.get<ProfissaoModel>(this, 'profissoes')
          as RealmList<ProfissaoModel>;
  @override
  set profissoes(covariant RealmList<ProfissaoModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<UsuarioModel>> get changes =>
      RealmObjectBase.getChanges<UsuarioModel>(this);

  @override
  UsuarioModel freeze() => RealmObjectBase.freezeObject<UsuarioModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(UsuarioModel._);
    return const SchemaObject(
        ObjectType.realmObject, UsuarioModel, 'UsuarioModel', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('nome', RealmPropertyType.string),
      SchemaProperty('idade', RealmPropertyType.int),
      SchemaProperty('numeros', RealmPropertyType.int,
          collectionType: RealmCollectionType.list),
      SchemaProperty('estadoCivil', RealmPropertyType.string),
      SchemaProperty('profissoes', RealmPropertyType.object,
          linkTarget: 'ProfissaoModel',
          collectionType: RealmCollectionType.list),
    ]);
  }
}
