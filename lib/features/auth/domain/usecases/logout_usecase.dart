import 'package:auth_flow_block_cleanarchitecture/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';
import '../repository/auth_repository.dart';

class LogoutUseCase implements UseCases<void,NoParams>{
   final AuthRepository repository;

  LogoutUseCase({ required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async{
    return await repository.logout();
  }
}