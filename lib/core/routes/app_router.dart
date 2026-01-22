import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/monitoring/presentation/pages/monitoring_page.dart';
import '../../features/monitoring/presentation/pages/monitoring_details_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/home',
        builder: (context, state) => const MonitoringPage(),
      ),
      GoRoute(
        path: '/monitoring-details',
        builder: (context, state) => const MonitoringDetailsPage(),
      ),
    ],
  );
}
