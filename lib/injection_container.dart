import 'package:auth_flow_block_cleanarchitecture/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:auth_flow_block_cleanarchitecture/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:auth_flow_block_cleanarchitecture/features/auth/data/repository/auth_repository_impl.dart';
import 'package:auth_flow_block_cleanarchitecture/features/auth/domain/usecases/check_auth_usecase.dart';
import 'package:auth_flow_block_cleanarchitecture/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:auth_flow_block_cleanarchitecture/features/auth/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl(),
      logoutUseCase: sl(),
      getCurrentUserUseCase: sl(),
      checkAuthUseCase: sl(),
    ),
  );
  
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => LogoutUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => CheckAuthUseCase(repository: sl()));

  sl.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(
              authRemoteDataSource: sl(),
              authLocalDataSource: sl()
          ));
  
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthLocalDatasource>(() => AuthLocalDataSourceImpl(sharedPreferences: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
