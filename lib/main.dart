import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:milckoapk/Screens/home_screen.dart';
import 'package:milckoapk/Screens/splash_screen.dart';
import 'package:milckoapk/Screens/welcome_screen.dart';
import 'package:milckoapk/firebase_options.dart';
import 'package:milckoapk/providers/auth_provider.dart';
import 'package:milckoapk/providers/location_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationProvider(),
        )
        ],
        child: const MyApp(),)
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=> AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          SplashScreen.id: (context) => const SplashScreen(),
        }
      ),
    );
  }
}
