import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'screens/homeWrapper.dart';
import 'services/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/loginsrc.dart';
import 'constants/constants.dart';

// DatePicker
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: Locale('en', 'US'),
        supportedLocales: [
          const Locale('en', 'US'), // English
        ],
        title: 'IMA app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(55, 48, 255, 1),
            secondary: white,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashSrc(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return HomeWrapper();
    }
    return LoginSrc();
  }
}

class SplashSrc extends StatefulWidget {
  const SplashSrc({Key? key}) : super(key: key);

  @override
  _SplashSrcState createState() => _SplashSrcState();
}

class _SplashSrcState extends State<SplashSrc> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        "assets/icons/imaicon.png",
        width: 250,
        height: 200,
        fit: BoxFit.contain,
      ),
      nextScreen: AuthenticationWrapper(),
      duration: 100,
      backgroundColor: primarybg,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
