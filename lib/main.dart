import 'package:chapa_admin/modules/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'modules/authentication/screens/login_screen.dart';
import 'modules/authentication/services/auth_service.dart';
import 'modules/categories/service/category_service.dart';
import 'utils/app_strings.dart';
import 'utils/app_themes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: "CHAPA",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(create: (_) => AuthService()),
          Provider<CategoryService>(create: (_) => CategoryService()),
        ],
        child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          child: MaterialApp(
            builder: (context, child) => MaterialApp(
              navigatorKey: navigatorKey,
              title: AppStrings.appName,
              theme: AppTheme.defaultTheme(context),
              debugShowCheckedModeBanner: false,
              home: const AuthWrapper(),
            ),
          ),
        ));
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          return user == null ? const LoginScreen() : HomeScreen();
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
