import 'package:auth_flow_block_cleanarchitecture/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
});

  Future<Either<Failure,void>> logout();

  Future<Either<Failure,UserEntity?>> getCurrentUser();

  Future<Either<Failure,bool>> isAuthenticated();
}