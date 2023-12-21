// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:gide/features/authentication/screens/splash_screen.dart';
import 'core/configs/configs.dart';
import 'core/router/app_route.dart';
import 'features/dashboard/custom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kCompanyName,
      debugShowCheckedModeBanner: false,
      //themeMode: ThemeMode.system,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().lightTheme,
      home: const CustomNavigationBar(),
      //  const SplashScreen(),
      onGenerateRoute: AppRouter.onGenerated,
      builder: (context, widget) {
        final media = MediaQuery.of(context);
        Dims.setSize(media);
        return widget!;
      },
    );
  }
}
