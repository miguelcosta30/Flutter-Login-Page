import 'package:bloc/bloc.dart';
import 'package:flutter_login_page/api_client_repository/user_api_client.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginBlocInitial()) {
    on<LoginBlocEventStarted>(
      (event, emit) async {
        emit(LoginLoadingState(
          email: event.email,
          password: event.password,
        ));
        UserApiClient? userApiClient = UserApiClient();
        try {
          final loginResponse = await userApiClient.getLogin(
            event.email,
            event.password,
          );

          if (loginResponse.status == 200) {
            emit(
                LoginSucessState(email: event.email, password: event.password));
          } else {
            emit(LoginFailureState(errorMessage: "Error"));
          }
        } on Object catch (_) {
          emit(LoginFailureState(errorMessage: "Error"));
        }
      },
    );
  }
}
