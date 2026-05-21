
import 'package:auth_flow_block_cleanarchitecture/core/error/failures.dart';
import 'package:auth_flow_block_cleanarchitecture/core/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';


class GetCurrentUserUseCase implements UseCases<UserEntity?,NoParams>{
  final AuthRepository repository;

  GetCurrentUserUseCase({required this.repository});

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) async {
    return await repository.getCurrentUser();
  }

}