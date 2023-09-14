import 'package:flutter/material.dart';
import 'package:gide/features/authentication/screens/splash_screen.dart';

import 'core/configs/configs.dart';
import 'core/router/app_route.dart';
import 'features/dashboard/custom_navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
      // const SplashScreen(),
      onGenerateRoute: AppRouter.onGenerated,
      builder: (context, widget){
        final media = MediaQuery.of(context);
        Dims.setSize(media);
        return widget!;
      },
    );
  }
}

