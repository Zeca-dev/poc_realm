// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:poc_realm/app/domain/entities/usuario.dart';

sealed class HomeState {
  final List<Usuario> usuarios;
  HomeState({this.usuarios = const []});
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  final bool isLoading;
  HomeLoading({this.isLoading = false});
}

class HomeLoaded extends HomeState {
  HomeLoaded({required super.usuarios});
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
