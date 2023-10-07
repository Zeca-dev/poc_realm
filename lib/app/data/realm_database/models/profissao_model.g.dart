// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profissao_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ProfissaoModel extends $ProfissaoModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ProfissaoModel(
    String id,
    String nome,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'nome', nome);
  }

  ProfissaoModel._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get nome => RealmObjectBase.get<String>(this, 'nome') as String;
  @override
  set nome(String value) => RealmObjectBase.set(this, 'nome', value);

  @override
  Stream<RealmObjectChanges<ProfissaoModel>> get changes =>
      RealmObjectBase.getChanges<ProfissaoModel>(this);

  @override
  ProfissaoModel freeze() => RealmObjectBase.freezeObject<ProfissaoModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ProfissaoModel._);
    return const SchemaObject(
        ObjectType.realmObject, ProfissaoModel, 'ProfissaoModel', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('nome', RealmPropertyType.string),
    ]);
  }
}
