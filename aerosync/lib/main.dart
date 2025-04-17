import 'package:aerosync/apis/sample.dart';
import 'package:aerosync/splash.dart';
import 'package:aerosync/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    Stripe.publishableKey =
      'pk_test_51OESAJCRcroZFCiULNlsytD5pQtuRNmaSrhLSBD8RYkjc2kta6Y8PtDXuq4snjTa6ai1SbuDnkUjApTjItYzpS6V00N5JjyXbZ';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Styles.primaryColor,
            ),
            inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
            useMaterial3: true,
          ),
          home: AnimatedSplashScreen());
    });
  }
}
