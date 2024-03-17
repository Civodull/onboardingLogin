// ignore: avoid_web_libraries_in_flutter

import 'package:city_hygiene_app/components/common/custom_form_button.dart';
import 'package:city_hygiene_app/components/common/custom_input_prefix.dart';
import 'package:city_hygiene_app/components/common/page_header.dart';
import 'package:city_hygiene_app/components/common/page_heading.dart';
import 'package:city_hygiene_app/components/forget_password_page.dart';
import 'package:city_hygiene_app/components/signup_page.dart';
import 'package:city_hygiene_app/repository/auth_repo.dart';
import 'package:city_hygiene_app/repository/auth_repo_objects/auth_response.dart';
import 'package:city_hygiene_app/repository/auth_repo_objects/user_info.dart';
import 'package:city_hygiene_app/views/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  AuthRepository authRepository = AuthRepository();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: Column(
          children: [
            const PageHeader(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        const PageHeading(
                          title: 'Se connecter',
                        ),
                        CustomPrefixInput(
                            labelText: "Email",
                            hintText: "Votre email",
                            textEditingController: _emailController,
                            inputPresent: true,
                            textInputType: TextInputType.emailAddress,
                            prefixPresent: true,
                            prefixIcon: const Icon(Icons.email),
                            validator: (textValue) {
                              if (textValue == null || textValue.isEmpty) {
                                return 'Champs requis!';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomPrefixInput(
                          labelText: 'Mot de passe',
                          hintText: 'Votre mot de passe',
                          obscureText: true,
                          suffixIcon: true,
                          textEditingController: _passwordController,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'Password requis!';
                            }
                            return null;
                          },
                        ),
                        Container(
                          width: size.width * 0.80,
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPasswordPage()))
                            },
                            child: const Text(
                              'Mot de passe oublié?',
                              style: TextStyle(
                                color: Color(0xff939393),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormButton(
                          innerText: 'Connexion',
                          onPressed: _handleLoginUser,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Pas de compte ? ',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff939393),
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupPage()))
                                },
                                child: const Text(
                                  "S'enregistrer",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff748288),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLoginUser() async {
    // login user
    if (_loginFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Soumission de données..')),
      );

      AuthResponse authResponse = await authRepository.login(
          _emailController.text, _passwordController.text);

      if (authResponse.accessToken != null) {
        UserInfo userInfo =
            await authRepository.getUserInfo(authResponse.accessToken!);

        moveToHomePage(userInfo, authResponse.accessToken!);
      }
    }
  }

  void moveToHomePage(UserInfo userInfo, String accesToken) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              HomePage(userInfo: userInfo, accessToken: accesToken)),
    );
  }
}
