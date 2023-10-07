import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_realm/app/data/realm_database/realm_database_config.dart';
import 'package:realm/realm.dart';

import 'ui/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void exportedBinds(Injector i) {
    i.addInstance(Realm(realmConfig));
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
  }
}
