
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:openapi/openapi.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Openapi openApi;

  LoginBloc({required this.openApi}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    
    try {
      final loginVM = LoginVMBuilder()
        ..username = event.username
        ..password = event.password;
      
      final loginResponse = await openApi.getAuthenticateControllerApi().authorize(loginVM: loginVM.build());

      if (loginResponse.statusCode == 200 || loginResponse.statusCode == 201) {
        final token = loginResponse.data!.idToken!;
        Openapi.jwt = token;
        
        final accResponse = await openApi.getAccountResourceApi().getAccount(headers: {'Authorization': 'Bearer $token'});

        if (accResponse.statusCode == 200) {
          emit(LoginSuccess(token: token));
        } else {
          emit(LoginFailure(error: 'Account details could not be retrieved.'));
        }
      } else {
        emit(LoginFailure(error: 'Invalid credentials'));
      }
    } catch (e) {
      emit(LoginFailure(error: 'Login failed. Please check your internet connection.'));
    }
  }
}





abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final String username;
  final String password;

  const LoginSubmitted({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}




abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  const LoginSuccess({required this.token});

  @override
  List<Object> get props => [token];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}