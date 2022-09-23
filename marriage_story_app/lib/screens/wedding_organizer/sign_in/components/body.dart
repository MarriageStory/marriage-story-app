import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/sign_in/components/background.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:marriage_story_app/service/auth_service.dart';
import 'package:marriage_story_app/model/user_model.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final textFieldFocusNode = FocusNode();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscured = true;
  bool isChecked = false;

  void _toggleObscured() {
    setState(
      () {
        _obscured = !_obscured;
        if (textFieldFocusNode.hasPrimaryFocus)
          return; // If focus is on text field, dont unfocus
        textFieldFocusNode.canRequestFocus =
            false; // Prevents focus if tap on eye
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 200,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masuk',
                  style: TextStyle(
                    color: Color(0xffFB6C90),
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Selamat datang kembali.',
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: const TextStyle(
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
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
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
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 45,
                        width: size.width * 0.768,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
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
                          onPressed: () {
                            var data = <String, dynamic>{
                              'email': _emailController.text,
                              'password': _passwordController.text,
                            };

                            try {
                              AuthService.authLogin(data).then((response) {
                                if (response.accessToken != "") {
                                  // Navigator.pushNamedAndRemoveUntil(
                                  //   context,
                                  //   "/home-screen",
                                  //   (route) => false,
                                  // );

                                  validasi();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Berhasil Login")));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Password Salah")));
                                }
                              });
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Terdapat Kesalahan")));
                            }
                          },
                          child: const Text(
                            "Masuk",
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
        ),
      ),
    );
  }

  void validasi() {
    String role = "";
    UserModel user = UserModel(
        id: 0,
        name: "",
        email: "",
        emailVerifiedAt: DateTime.now(),
        roleName: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());

    Future<void> getUserProfile() async {
      try {
        var data = await AuthService.authUserProfile();

        setState(() {
          user = data;
        });
      } catch (e) {
        Navigator.pushReplacementNamed(context, "/base-screen");
      }
      if ("Client" == "Client") {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/home-client-screen",
          (route) => false,
        );

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Berhasil Login")));
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/home-screen",
          (route) => false,
        );

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Berhasil Login")));
      }
    }

    getUserProfile();

    // @override
    // void initState() {
    //   super.initState();
    //   getUserProfile();
    // }
  }
}
