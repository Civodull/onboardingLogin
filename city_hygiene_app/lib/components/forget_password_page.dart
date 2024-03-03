import 'package:city_hygiene_app/components/common/custom_form_button.dart';
import 'package:city_hygiene_app/components/common/custom_input_prefix.dart';
import 'package:city_hygiene_app/components/common/page_header.dart';
import 'package:city_hygiene_app/components/common/page_heading.dart';
import 'package:city_hygiene_app/components/login_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _forgetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    key: _forgetPasswordFormKey,
                    child: Column(
                      children: [
                        const PageHeading(
                          title: 'Mot de passe oublié',
                        ),
                        CustomPrefixInput(
                            labelText: 'Email',
                            hintText: 'Votre email ici',
                            textEditingController: _emailController,
                            inputPresent: true,
                            textInputType: TextInputType.emailAddress,
                            prefixPresent: true,
                            prefixIcon: const Icon(Icons.email),
                            validator: (textValue) {
                              if (textValue == null || textValue.isEmpty) {
                                return 'Email requis!';
                              }
                              if (!EmailValidator.validate(textValue)) {
                                return 'Veuillez entrer un email correct';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormButton(
                          innerText: 'Soumettre',
                          onPressed: _handleForgetPassword,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()))
                            },
                            child: const Text(
                              'Retour sur connexion',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff939393),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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

  void _handleForgetPassword() {
    // forget password
    if (_forgetPasswordFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Soumission de données..')),
      );
    }
  }
}
