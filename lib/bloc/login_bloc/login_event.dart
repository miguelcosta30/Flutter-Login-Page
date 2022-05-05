part of 'login_bloc.dart';

@immutable
abstract class LoginBlocEvent extends Equatable {}

class LoginBlocEventStarted extends LoginBlocEvent {
  final String email;
  final String password;

  LoginBlocEventStarted({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
