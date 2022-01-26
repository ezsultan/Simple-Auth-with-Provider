import 'package:ezcommerce/provider/auth_provider.dart';
import 'package:ezcommerce/screen/auth/sign_up_screen.dart';
import 'package:ezcommerce/screen/ui/main_screen.dart';
import 'package:ezcommerce/screen/ui/profile_page.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../screen/auth/sign_in_screen.dart';
import '../screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const SplashScreen()),
          GetPage(name: '/signin', page: () => const SignInScreen()),
          GetPage(name: '/signup', page: () => const SignUpScreen()),
          GetPage(name: '/home', page: () => const MainScreen()),
          GetPage(name: '/profile', page: () => const ProfileScreen()),
        ],
      ),
    );
  }
}
