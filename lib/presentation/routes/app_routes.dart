import 'package:go_router/go_router.dart';
import 'package:work_tracker/presentation/page/root/root_page.dart';

class AppRoutes {
  static final appRoutes = GoRouter(
    routes: [
      GoRoute(
        path: AppPath.init,
        builder: (context, state) => const RootPage(),
      ),
    ],
  );

  AppRoutes._();
}

class AppPath {
  static const init = '/';
}
