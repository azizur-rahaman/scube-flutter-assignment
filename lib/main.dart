import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/app_router.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const ScubeApp());
}

class ScubeApp extends StatelessWidget {
  const ScubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Standard mobile design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Scube Control & Monitoring',
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
