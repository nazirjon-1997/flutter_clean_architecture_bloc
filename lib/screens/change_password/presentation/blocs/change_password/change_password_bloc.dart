import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_bloc/core/utils/constants.dart';
import 'package:flutter_clean_architecture_bloc/screens/change_password/domain/usecases/change_password.dart';

import 'bloc.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePassword changePassword;

  ChangePasswordBloc({@required this.changePassword});

  @override
  ChangePasswordState get initialState => InitialState();

  @override
  Stream<ChangePasswordState> mapEventToState(
      ChangePasswordEvent event) async* {
    if (event is PasswordChangeEvent) {
      yield LoadingState();
      final result = await changePassword(ChangePasswordParams(
        oldPassword: event.oldPassword,
        newPassword: event.newPassword,
      ));
      yield* result.fold((failure) async* {
        yield ErrorState(CHANGE_PASSWORD_ERROR);
      }, (success) async* {
        yield SuccessfulState();
      });
    }
  }
}
