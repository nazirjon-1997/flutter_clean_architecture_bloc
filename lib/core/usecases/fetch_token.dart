import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_bloc/core/error/failures.dart';
import 'package:flutter_clean_architecture_bloc/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_bloc/screens/login/domain/entities/login.dart';
import 'package:flutter_clean_architecture_bloc/screens/login/domain/repositories/login_repository.dart';

class FetchToken implements UseCase<Login, TokenParams> {
  final LoginRepository repository;

  FetchToken({@required this.repository});

  @override
  Future<Either<Failure, Login>> call(TokenParams params) async {
    return await repository.fetchCachedToken();
  }
}

class TokenParams extends Equatable {}
