import 'package:city_hygiene_app/components/login_page.dart';
import 'package:city_hygiene_app/views/home_page.dart';
import 'package:city_hygiene_app/views/onboarding_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // We move towards to the onboarding page
      //Il serait bon ici de rajouter un check pour voir si
      //l'onboarding a deja ete fait, si oui on passe directement sur login
      home: OnboardingPage(),
    );
  }
}
