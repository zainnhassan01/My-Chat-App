import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mychatproject/data%20models/providerclass.dart';
import 'package:mychatproject/data%20models/usermodel.dart';
import 'package:mychatproject/firebase_options.dart';
import 'package:mychatproject/screens/login.dart';
import 'package:mychatproject/screens/splash.dart';
import 'package:mychatproject/services/firebaseauth.dart';
import 'package:mychatproject/utlities/colors.dart';
import 'package:mychatproject/utlities/mainwrapper.dart';
import 'package:provider/provider.dart';

late Size mq;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    StreamProvider<UserStreamDataModel?>.value(
        value: AuthService().userStream, initialData: null),
    ChangeNotifierProvider(create: (context) => ProviderClass()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Chat',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        scaffoldBackgroundColor: backgroundColor,
        splashColor: Colors.purple.shade100,
      ),
      routes: {
        "/login": (context) => const Login(),
        "/wrapper":(context) => const Wrapper(),
      },
      home: const SplashScreen(),
    );
  }
}
