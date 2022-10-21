import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:marriage_story_app/screens/sign_up/components/background.dart';
import 'package:marriage_story_app/service/auth_service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final textFieldFocusNode = FocusNode();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscured = true;
  bool isChecked = false;

  void _toggleObscured() {
    setState(
      () {
        _obscured = !_obscured;
        if (textFieldFocusNode.hasPrimaryFocus) {
          return;
        } // If focus is on text field, dont unfocus
        textFieldFocusNode.canRequestFocus =
            false; // Prevents focus if tap on eye
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 250,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar',
              style: TextStyle(
                color: Color(0xffFB6C90),
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Selamat datang.',
              style: TextStyle(
                color: Color(0xff333333),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Color(0xff828282),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Color(0xff828282),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      controller: _emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(
                          color: Color(0xff828282),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Color(0xff828282),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      controller: _userNameController,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscured,
                      focusNode: textFieldFocusNode,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          color: Color(0xff828282),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _toggleObscured,
                          child: Icon(
                            _obscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xffFB6C90),
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        color: Color(0xff828282),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      controller: _passwordController,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 45,
                    width: size.width * 0.768,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffFB6C90),
                          Color(0xffFB8DA0),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        Map<String, dynamic> body = {
                          'name': _userNameController.text,
                          'email': _emailController.text,
                          'password': _passwordController.text,
                          'role_name': "Client",
                          'role_slug': "Client"
                        };

                        try {
                          await AuthService.authRegister(body).then((value) {
                            if (value == true) {
                              Get.toNamed(RouteName.login);
                              // Navigator.pushReplacementNamed(
                              //     context, "/sign-in");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'You have successfully create a account')));
                            }
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Terdapat Kesalahan !')));
                        }
                      },
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
