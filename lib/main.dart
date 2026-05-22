import 'package:auth_flow_block_cleanarchitecture/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'injection_container.dart' ;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<AuthBloc>(),
    child: Builder(builder: (context) {
      final authBloc = context.read<AuthBloc>();
      final appRoute = AppRouter(authBloc: authBloc);

      return MaterialApp.router(
        title:  'Auth Clean App',
        routerConfig: appRoute.router,
        debugShowCheckedModeBanner: false,
      );

    }),);
  }
}
