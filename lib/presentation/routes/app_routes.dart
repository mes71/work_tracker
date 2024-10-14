import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_tracker/presentation/page/auth/auth_page.dart';
import 'package:work_tracker/presentation/page/home/home_page.dart';
import 'package:work_tracker/presentation/page/report/report_page.dart';
import 'package:work_tracker/presentation/page/root/root_page.dart';
import 'package:work_tracker/presentation/page/setting/setting_page.dart';
import 'package:work_tracker/presentation/page/splash/splash_page.dart';

class AppRoutes {
  static final appRoutes = GoRouter(
    initialLocation: AppPath.init,
    routes: [
      GoRoute(
        name: AppPath.init,
        path: AppPath.init,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: AppPath.auth,
        path: AppPath.auth,
        builder: (context, state) => AuthPage(),
      ),
      ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return RootPage(child: child);
          },
          routes: [
            GoRoute(
              name: AppPath.home,
              path: AppPath.home,
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              name: AppPath.setting,
              path: AppPath.setting,
              builder: (context, state) => const SettingPage(),
            ),
            GoRoute(
              name: AppPath.report,
              path: AppPath.report,
              builder: (context, state) => const ReportPage(),
            ),
          ])
    ],
  );

  AppRoutes._();
}

class AppPath {
  AppPath._();

  static const init = '/';
  static const home = '/home';
  static const auth = '/auth';
  static const report = '/report';
  static const setting = '/setting';
}
