// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profissao_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProfissaoModel extends $ProfissaoModel with RealmEntity, RealmObjectBase, RealmObject {
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
Stream<RealmObjectChanges<ProfissaoModel>> get changes => RealmObjectBase.getChanges<ProfissaoModel>(this);

@override
Stream<RealmObjectChanges<ProfissaoModel>> changesFor([List<String>? keyPaths]) => RealmObjectBase.getChangesFor<ProfissaoModel>(this, keyPaths);

@override
ProfissaoModel freeze() => RealmObjectBase.freezeObject<ProfissaoModel>(this);

EJsonValue toEJson() {
return <String, dynamic>{
'id': id.toEJson(),
'nome': nome.toEJson(),
};
}
static EJsonValue _toEJson(ProfissaoModel value) => value.toEJson();
static ProfissaoModel _fromEJson(EJsonValue ejson) {
return switch (ejson) {
{
'id': EJsonValue id,
'nome': EJsonValue nome,
} => ProfissaoModel(
fromEJson(id),
fromEJson(nome),
),
_ => raiseInvalidEJson(ejson),
};
}
static final schema = () {
RealmObjectBase.registerFactory(ProfissaoModel._);
register(_toEJson, _fromEJson);
return SchemaObject(ObjectType.realmObject, ProfissaoModel, 'ProfissaoModel', [
SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
SchemaProperty('nome', RealmPropertyType.string),
]);
}();

@override
SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
