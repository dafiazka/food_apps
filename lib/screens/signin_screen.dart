import 'package:flutter/widgets.dart';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_apps/theme.dart';
import 'package:food_apps/screens/confirm_screen.dart';
import 'package:food_apps/screens/home_screen.dart';
import 'package:food_apps/widgets/menu_card.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_apps/screens/login_screen.dart';

class SignInScreen extends StatelessWidget {
  // late bool obscureText;
  bool passwordVisible = false;
  bool isLoading = false;

  // @override
  // void initState() {
  //   // super.initState();
  //   obscureText = true;
  // }

  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
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
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      elevation: 2,
                      child: AspectRatio(
                          aspectRatio: 10 / 1,
                          child: Center(
                              child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Email',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(8)),
                            // controller: emailController,
                            // validator: validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          )))),
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
                                      decoration: const InputDecoration(
                                          hintText: 'Password',
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(8)),
                                      // controller: passwordController,
                                      // obscureText: obscureText,
                                    ))),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  // color: !obscureText
                                  //     ? blackColor.withOpacity(0.3)
                                  //     : blackColor,
                                ),
                                onPressed: () {
                                  (() {});
                                },
                              )
                            ],
                          ))),
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: ElevatedButton(
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              '''Login''',
                            ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 167, 146, 250),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          minimumSize: Size(100, 36)),
                      onPressed: () {
                        final provider = Provider.of<LoginScreenProvider>(
                            context,
                            listen: false);
                        provider.Login();
                      },
                    ),
                  ),
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
}
