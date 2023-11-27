// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:phc_lab/Firebase_authentication/authentication_repository.dart';
import 'package:phc_lab/Firebase_authentication/firebase_options.dart';
import 'package:phc_lab/presentation/login_screen/login_screen.dart';
import 'core/app_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) {
      Get.put(AuthenticationRepository());
      runApp(MyApp());
    });
  });
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'phc_lab',
      initialBinding: InitialBindings(),
      // initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
      home: LoginScreen(),
    );
  }
}
