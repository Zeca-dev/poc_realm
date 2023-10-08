import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_realm/app/domain/entities/usuario.dart';
import 'package:poc_realm/app/domain/repositories/usuario_repository_interface.dart';
import 'package:poc_realm/app/domain/states/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final UsuarioRepository usuarioRepository;

  HomeCubit(this.usuarioRepository) : super(HomeInitial());

  Future<void> buscarUsuarios() async {
    emit(HomeLoading(isLoading: true));
    final usuarios = await usuarioRepository.buscarUsuarios();
    emit(HomeLoading(isLoading: false));

    emit(HomeLoaded(usuarios: usuarios));
  }

  Future<void> salvarUsuario(Usuario usuario) async {
    emit(HomeLoading(isLoading: true));
    await usuarioRepository.salvarUsuario(usuario);
    emit(HomeLoading(isLoading: false));
    buscarUsuarios();
  }

  Future<void> atualizarUsuario(Usuario usuario) async {
    emit(HomeLoading(isLoading: true));
    await usuarioRepository.atualizarUsuario(usuario);
    emit(HomeLoading(isLoading: false));
    buscarUsuarios();
  }

  Future<void> deletarUsuario(Usuario usuario) async {
    emit(HomeLoading(isLoading: true));
    await usuarioRepository.deletarUsuario(usuario);
    emit(HomeLoading(isLoading: false));
    buscarUsuarios();
  }
}
