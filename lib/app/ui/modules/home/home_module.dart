import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_realm/app/app_module.dart';
import 'package:poc_realm/app/data/realm_database/usuario_realm_repository.dart';
import 'package:poc_realm/app/domain/repositories/usuario_repository_interface.dart';
import 'package:poc_realm/app/ui/modules/home/home_cubit.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<UsuarioRepository>(UsuarioRealmRepository.new);
    i.addLazySingleton(HomeCubit.new);
  }

  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => HomePage(homeCubit: Modular.get<HomeCubit>()));
  }
}
