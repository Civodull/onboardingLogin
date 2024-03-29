import 'dart:io';
import 'package:city_hygiene_app/components/common/custom_form_button.dart';
import 'package:city_hygiene_app/components/common/custom_input_prefix.dart';
import 'package:city_hygiene_app/components/common/page_header.dart';
import 'package:city_hygiene_app/components/common/page_heading.dart';
import 'package:city_hygiene_app/components/login_page.dart';
import 'package:city_hygiene_app/repository/register_repo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  File? _profileImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _communeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final _signupFormKey = GlobalKey<FormState>();

  final RegisterRepo _registerRepo = RegisterRepo();

  @override
  void dispose() {
    _nameController.dispose();
    _firstNameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _communeController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  //Garder ce code au cas ou une photo de profile est demandé pour les
  //utilisateur. Ca permet d'ouvrir la galerie du telephone et choisir.
  Future _pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _profileImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                const PageHeader(),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const PageHeading(
                        title: 'Enregistrement',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomPrefixInput(
                          labelText: 'Nom',
                          hintText: 'Votre nom',
                          prefixIcon: const Icon(Icons.person),
                          prefixPresent: true,
                          textEditingController: _nameController,
                          inputPresent: true,
                          textInputType: TextInputType.name,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'Ce champs est requis!';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomPrefixInput(
                          labelText: 'Prénom',
                          hintText: 'Votre prénom',
                          prefixIcon: const Icon(Icons.person),
                          prefixPresent: true,
                          textEditingController: _firstNameController,
                          inputPresent: true,
                          textInputType: TextInputType.name,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'Ce champs est requis!';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomPrefixInput(
                          //Ce champs n'est pas utilisé au niveau de l'API,
                          //Le retirer si c'est pertinent.
                          labelText: 'Adresse',
                          hintText: 'Votre adresse',
                          prefixIcon: const Icon(Icons.location_pin),
                          prefixPresent: true,
                          textEditingController: _addressController,
                          inputPresent: true,
                          textInputType: TextInputType.streetAddress,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'Ce champs est requis!';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomPrefixInput(
                          labelText: 'Ville',
                          hintText: 'Votre ville',
                          prefixIcon: const Icon(Icons.location_pin),
                          prefixPresent: true,
                          textEditingController: _communeController,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'Ce champs est requis!';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomPrefixInput(
                          labelText: 'Email',
                          hintText: 'Votre email',
                          prefixIcon: const Icon(Icons.email),
                          prefixPresent: true,
                          textEditingController: _emailController,
                          inputPresent: true,
                          textInputType: TextInputType.name,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return "L'email est requis!";
                            }
                            if (!EmailValidator.validate(textValue)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomPrefixInput(
                          labelText: 'Numero de téléphone',
                          hintText: 'Entrez votre numéro',
                          prefixIcon: const Icon(Icons.phone),
                          prefixPresent: true,
                          inputPresent: true,
                          textInputType: TextInputType.phone,
                          textEditingController: _phoneNumberController,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'Votre numéro et requis!';
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
                        textInputType: TextInputType.visiblePassword,
                        textEditingController: _passwordController,
                        inputPresent: true,
                        validator: (textValue) {
                          if (textValue == null || textValue.isEmpty) {
                            return 'Le mot de passe est requis!';
                          }
                          return null;
                        },
                        suffixIcon: true,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      CustomFormButton(
                        innerText: 'Signup',
                        onPressed: _handleSignupUser,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Vous avez déja un compte ? ',
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
                                            const LoginPage()))
                              },
                              child: const Text(
                                'Connexion',
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
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSignupUser() async {
    // signup user
    if (_signupFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Soumission des données..')),
      );
      int villeId = 0;

      if (_communeController.text == "Libreville") {
        villeId = 1;
        //CE CODE EST PAS COMPLET!!!!
        //Il faut convenir avec le responsable de l'API pour
        //voir comment mapper chaque nom de ville avec leur ID,
        //Car ce sont les ID (int) qui sont passé dans l'API.
      }
      bool didRegistSucceed = false;
      didRegistSucceed = await _registerRepo.registerUser(
          _firstNameController.text,
          _nameController.text,
          _emailController.text,
          _passwordController.text,
          _phoneNumberController.text,
          villeId);

      if (didRegistSucceed) {
        showRegularToast(
            "Veuillez vérifier votre email pour activer votre compte.");
        moveToLogin();
      }
    }
  }

  void showRegularToast(String toastText) {
    FToast fToast = FToast();
    fToast.init(context);

    fToast.showToast(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          toastText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  void moveToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
