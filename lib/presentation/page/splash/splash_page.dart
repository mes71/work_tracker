import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:work_tracker/domain/cubit/splash/splash_cubit.dart';
import 'package:work_tracker/presentation/routes/app_routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..loadSplash(),
      child: BlocListener<SplashCubit, bool>(
        listener: (context, state) {
          if (state) {
            context.goNamed(AppPath.auth);
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
