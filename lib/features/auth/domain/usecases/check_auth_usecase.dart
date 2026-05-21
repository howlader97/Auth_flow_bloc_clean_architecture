import 'package:auth_flow_block_cleanarchitecture/core/error/failures.dart';
import 'package:auth_flow_block_cleanarchitecture/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';

class CheckAuthUseCase implements UseCases<bool,NoParams>{
  final AuthRepository repository;

  CheckAuthUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.isAuthenticated();
  }
}