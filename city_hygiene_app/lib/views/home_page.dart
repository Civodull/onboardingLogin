import 'package:city_hygiene_app/components/common/classic_custom_box.dart';
import 'package:city_hygiene_app/repository/auth_repo_objects/user_info.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final UserInfo userInfo;
  final String accessToken;
  const HomePage(
      {super.key, required this.userInfo, required this.accessToken});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIG 241 - Clean Africa'),
        backgroundColor: const Color.fromARGB(255, 0, 181, 105),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 240, 254, 248),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/man.png'),
                  radius: 20,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bonjour",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.userInfo.user!.name!.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const ClassicCustomBox(
              firstText: "Le premier texte",
              secondText: "Le second texte",
              thirdText: "Le troisieme texte",
              numberOfButtons: 1,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(158, 255, 255, 255),
        selectedItemColor: const Color.fromARGB(255, 0, 181, 105),
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
              ),
              label: 'Accueil'),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
              label: 'Suivi alertes'),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle),
              ),
              label: 'Mon compte'),
        ],
      ),
    );
  }
}
