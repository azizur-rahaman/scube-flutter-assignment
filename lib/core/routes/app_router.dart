import 'package:flutter/material.dart';
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
      GoRoute(
        path: loginPath,
        pageBuilder: (context, state) =>
            _buildPageWithAnimation(context, state, const LoginPage()),
      ),
      GoRoute(
        path: monitoringPath,
        pageBuilder: (context, state) =>
            _buildPageWithAnimation(context, state, const MonitoringPage()),
      ),
      GoRoute(
        path: monitoringDetailsPath,
        pageBuilder: (context, state) => _buildPageWithAnimation(
          context,
          state,
          const MonitoringDetailsPage(),
        ),
      ),
    ],
  );

  static CustomTransitionPage _buildPageWithAnimation(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeOutCubic;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        // Combine Slide with Fade for a premium feel
        var fadeAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn, // Fade in slightly faster
        );

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(opacity: fadeAnimation, child: child),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}
