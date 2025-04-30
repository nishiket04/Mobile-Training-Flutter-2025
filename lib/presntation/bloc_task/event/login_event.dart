part of '../bloc/login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginUser extends LoginEvent {
  final Map<String,dynamic> data;

  LoginUser({required this.data});
}
