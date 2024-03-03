import 'package:city_hygiene_app/components/common/onboarding_box.dart';
import 'package:city_hygiene_app/components/login_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int pageLevel = 1;
  BoardingBox boardingBox = const BoardingBox(
      assetImage: AssetImage('assets/images/pana.png'),
      text1: "Créer votre compte en toute sécurité",
      text2:
          "Complétez votre profil afin de pleinement bénéficier des fonctionnalités de l'application");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 254, 248),
      ),
      backgroundColor: const Color.fromARGB(255, 240, 254, 248),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.1,
            ),
            boardingBox,
            SizedBox(
              height: size.height * 0.07,
            ),
            Container(
              height: 4,
              width: 45,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 242, 175, 6),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            TextButton(
              onPressed: () {
                if (pageLevel == 1) {
                  setState(() {
                    boardingBox = const BoardingBox(
                        assetImage: AssetImage('assets/images/trash.png'),
                        text1: "Signaler une anomalie sur le domaine public.",
                        text2: "Participez à l'assainissement urbain");
                  });
                } else if (pageLevel == 2) {
                  setState(() {
                    boardingBox = const BoardingBox(
                        assetImage: AssetImage('assets/images/amico.png'),
                        text1:
                            "Restez informé sur les nouvelles de votre commune.",
                        text2: "Soyez au courant des derniers mouvements");
                  });
                } else if (pageLevel == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
                pageLevel++;
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
                backgroundColor: Colors
                    .transparent, // Set the background color to transparent
                // You can customize other properties like padding, elevation, etc. here
              ),
              child: const Text(
                'Suivant',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
