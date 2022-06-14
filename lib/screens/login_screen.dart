import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_apps/theme.dart';
import 'package:food_apps/screens/confirm_screen.dart';
import 'package:food_apps/screens/home_screen.dart';
import 'package:food_apps/widgets/menu_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  // late bool obscureText;
  bool isLoading = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void initState() {
  //   super.initState();
  //   obscureText = true;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        key: _key,
        body: Container(
          padding: const EdgeInsets.all(20),
          color: BlueColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                width: 150,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Material(
                          color: whiteColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          elevation: 2,
                          child: AspectRatio(
                              aspectRatio: 10 / 1,
                              child: Center(
                                  child: TextFormField(
                                controller: emailController,
                                validator: validateEmail,
                                decoration: const InputDecoration(
                                    hintText: 'Email',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(8)),
                                keyboardType: TextInputType.emailAddress,
                              ))))],
                      Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Material(
                              color: whiteColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              elevation: 2,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: AspectRatio(
                                        aspectRatio: 10 / 1,
                                        child: Center(
                                            child: TextFormField(
                                          controller: passwordController,
                                          validator: validatePassword,
                                          decoration: const InputDecoration(
                                              hintText: 'Password',
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.all(8)),
                                        ))),
                                  ),]
                                  IconButton(
                                      icon: Icon(Icons.remove_red_eye,
                                          color: (blackColor)),
                                      onPressed: Login)
                                ],
                              ))),)
                      // Container(
                      //     margin: const EdgeInsets.only(top: 40),
                      //     width: MediaQuery.of(context).size.width,
                      //     child: MaterialButton(
                      //       onPressed: Login,
                            // user != null
                            //     ? null
                            //     : () async {
                            //         setState(() {
                            //           isLoading = true;
                            //           errorMessage = '';
                            //         });
                            //         if (_key.currentState!.validate()) {
                            //           try {
                            //             await FirebaseAuth.instance
                            //                 .signInWithEmailAndPassword(
                            //               email: emailController.text,
                            //               password: passwordController.text,
                            //             );
                            //           } on FirebaseAuthException catch (error) {
                            //             errorMessage = error.message!;
                            //           }
                            //           setState(() => isLoading = false);
                            //         }
                            //       },
                            // ? null
                            // : () async {
                            //     setState(() {
                            //       isLoading = true;
                            //       errorMessage = '';
                            //     });
                            //     if (_key.currentState!.validate()) {
                            //       try {
                            //         await FirebaseAuth.instance
                            //             .signInWithEmailAndPassword(
                            //           email: emailController.text,
                            //           password: passwordController.text,
                            //         );
                            //       } on FirebaseAuthException catch (error) {
                            //         errorMessage = error.message!;
                            //       }
                            //       setState(() => isLoading = false);
                            //     }
                            //   },
                            child: const Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16)),
                            color: yellowColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            padding: const EdgeInsets.all(16),
                          )),
                    ],
                  )),
              const SizedBox(
                height: 42,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Future Login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail address is required.';
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Password is required.';
  }

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';
  }

  return null;
}
