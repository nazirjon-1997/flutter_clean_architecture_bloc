import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_bloc/core/error/failures.dart';

abstract class ChangePasswordRepository {
  Future<Either<Failure, bool>> changePassword(String oldPassword, String newPassword);
}