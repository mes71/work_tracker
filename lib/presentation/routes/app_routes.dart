import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_tracker/presentation/page/home/home_page.dart';
import 'package:work_tracker/presentation/page/report/report_page.dart';
import 'package:work_tracker/presentation/page/root/root_page.dart';
import 'package:work_tracker/presentation/page/setting/setting_page.dart';

class AppRoutes {
  static final appRoutes = GoRouter(
    initialLocation: AppPath.home,
    routes: [
      ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return RootPage(child: child);
          },
          routes: [
            GoRoute(
              path: AppPath.home,
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              path: AppPath.setting,
              builder: (context, state) => const SettingPage(),
            ),
            GoRoute(
              path: AppPath.report,
              builder: (context, state) => const ReportPage(),
            ),
          ])
    ],
  );

  void Root
  AppRoutes._();
}

class AppPath {
  static const init = '/';
  static const home = '/home';
  static const report = '/report';
  static const setting = '/setting';
}
