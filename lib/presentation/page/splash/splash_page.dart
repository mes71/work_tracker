import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:work_tracker/data/di/injection.dart';
import 'package:work_tracker/data/source/auth/auth_data_source_imp.dart';
import 'package:work_tracker/domain/bloc/auth/auth_bloc.dart';
import 'package:work_tracker/presentation/routes/app_routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(di<AuthDataSourceImp>())..add(AuthStarted()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.goNamed(AppPath.home);
          } else if (state is Unauthenticated || state is AuthError) {
            context.goNamed(AppPath.home);
          }
        },
        child: Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Lottie.asset('assets/anim/splash.json'),
                )
              ]),
        ),
      ),
    );
  }
}
