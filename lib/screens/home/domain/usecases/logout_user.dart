import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_bloc/core/error/failures.dart';
import 'package:flutter_clean_architecture_bloc/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_bloc/screens/home/domain/repositories/home_repository.dart';

class LogOutUser implements UseCase<bool, LogOutParams> {
  final HomeRepository repository;

  LogOutUser({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(LogOutParams params) async {
    return await repository.logoutUser(params.token);
  }
}

class LogOutParams extends Equatable {
  final String token;
  LogOutParams({@required this.token}) : super([token]);
}
