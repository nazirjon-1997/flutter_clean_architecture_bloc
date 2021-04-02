import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_bloc/core/error/failures.dart';
import 'package:flutter_clean_architecture_bloc/core/utils/constants.dart';
import 'package:flutter_clean_architecture_bloc/screens/login/domain/entities/login.dart';
import 'package:flutter_clean_architecture_bloc/core/usecases/fetch_token.dart';
import 'package:flutter_clean_architecture_bloc/screens/login/domain/usecases/login_user.dart';

import 'bloc.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  final LoginUser loginUser;
  final FetchToken fetchToken;

  UserLoginBloc({@required this.loginUser, @required this.fetchToken});

  @override
  UserLoginState get initialState => NotLoggedState();

  @override
  Stream<UserLoginState> mapEventToState(UserLoginEvent event) async* {
    if (event is CheckLoginStatusEvent) {
      yield LoadingState();
      final result = await fetchToken(TokenParams());
      yield* result.fold((failure) async* {
        yield NotLoggedState();
      }, (success) async* {
        yield LoggedState(login: Login(token: success.token));
      });
    } else if (event is LoginEvent) {
      yield LoadingState();
      final result = await loginUser(
          LoginParams(email: event.email, password: event.password));
      yield* result.fold((failure) async* {
        if (failure is NoConnectionFailure) {
          yield ErrorState(message: NO_CONNECTION_ERROR);
        } else {
          yield ErrorState(message: LOGGING_ERROR);
        }
      }, (success) async* {
        yield LoggedState(login: Login(token: success.token));
      });
    } else if (event is SkipLoginEvent) {
      yield LoggedState(login: Login(token: "111111111111111111111111"));
    }
  }
}
