import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/monitoring/presentation/pages/monitoring_page.dart';
import '../../features/monitoring/presentation/pages/monitoring_details_page.dart';

class AppRouter {
  static const String splashPath = '/';
  static const String loginPath = '/login';
  static const String monitoringPath = '/home';
  static const String monitoringDetailsPath = '/monitoring-details';

  static final router = GoRouter(
    initialLocation: splashPath,
    routes: [
      GoRoute(
        path: splashPath,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(path: loginPath, builder: (context, state) => const LoginPage()),
      GoRoute(
        path: monitoringPath,
        builder: (context, state) => const MonitoringPage(),
      ),
      GoRoute(
        path: monitoringDetailsPath,
        builder: (context, state) => const MonitoringDetailsPage(),
      ),
    ],
  );
}
