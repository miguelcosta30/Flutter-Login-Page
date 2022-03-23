part of 'login_bloc.dart';

@immutable
abstract class LoginBlocState extends Equatable {}

class LoginBlocInitial extends LoginBlocState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginBlocState {
  final String email;
  final String password;
  LoginLoadingState({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

class LoginSucessState extends LoginBlocState {
  final String email;
  final String password;
  LoginSucessState({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

class LoginFailureState extends LoginBlocState {
  final String errorMessage;
  LoginFailureState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}
