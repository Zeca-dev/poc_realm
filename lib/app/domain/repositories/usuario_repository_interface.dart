import '../entities/usuario.dart';

abstract interface class UsuarioRepository {
  Future<List<Usuario>> buscarUsuarios();
  Future<void> salvarUsuario(Usuario usuario);
  Future<void> atualizarUsuario(Usuario usuario);
  Future<void> deletarUsuario(Usuario usuario);
}
