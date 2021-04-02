import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_bloc/core/error/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, bool>> logoutUser(String token);
}
