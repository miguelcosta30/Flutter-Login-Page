part of 'login_bloc.dart';

@immutable
abstract class LoginBlocEvent {
  final String email;
  final String password;
  const LoginBlocEvent({
    required this.email,
    required this.password,
  });
}
