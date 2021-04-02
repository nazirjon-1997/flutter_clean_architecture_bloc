import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_bloc/core/error/exceptions.dart';
import 'package:flutter_clean_architecture_bloc/core/error/failures.dart';
import 'package:flutter_clean_architecture_bloc/core/network/network_info.dart';
import 'package:flutter_clean_architecture_bloc/screens/home/data/datasources/home_local_datasource.dart';
import 'package:flutter_clean_architecture_bloc/screens/home/data/datasources/home_remote_datasource.dart';
import 'package:flutter_clean_architecture_bloc/screens/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, bool>> logoutUser(String token) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.logoutUser(token);
        try {
          await localDataSource.clearToken();
          return Right(true);
        } on CacheException {
          return Left(CacheFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
