import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc(LoginBlocState initialState) : super(LoginBlocInitial());
}

@override
Stream<LoginBlocState> mapEventToState(
  LoginBlocEvent event,
) async* {
  if (event is LoginBlocEvent) {
    yield* _mapLoginLoadingState(
      event,
    );
  }
}

Stream<LoginBlocState> _mapLoginLoadingState(
  LoginBlocEvent event,
) async* {
  yield LoginLoadingState(
    email: event.email,
    password: event.password,
  );

  try {
    //final loginResponse= await *request to the backend*
    //if(loginResponse.statusCode==200)
    yield LoginSucessState(email: event.email, password: event.password);
  } on Object catch (_) {
    yield LoginFailureState(errorMessage: "Error");
  }
}
