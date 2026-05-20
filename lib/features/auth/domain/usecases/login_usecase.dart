import 'package:auth_flow_block_cleanarchitecture/core/error/failures.dart';
import 'package:auth_flow_block_cleanarchitecture/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';
import '../entity/user_entity.dart';

class LoginUseCase implements UseCases<UserEntity,LoginParams>{
  final AuthRepository  repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(params)async {
   return await repository.login(email: params.email, password: params.password);
  }
}

class LoginParams{
  final String email;
  final String password;
  LoginParams({required this.email, required this.password});
}