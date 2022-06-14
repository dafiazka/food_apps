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

class LoginScreenProvider extends ChangeNotifier {
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  // String errorMessage = '';

  // final GlobalKey<FormState> _key = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  Future Login() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future Logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

// String? validateEmail(String? formEmail) {
//   if (formEmail == null || formEmail.isEmpty) {
//     return 'E-mail address is required.';
//   }

//   String pattern = r'\w+@\w+\.\w+';
//   RegExp regex = RegExp(pattern);
//   if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

//   return null;
// }

// String? validatePassword(String? formPassword) {
//   if (formPassword == null || formPassword.isEmpty) {
//     return 'Password is required.';
//   }

//   String pattern =
//       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//   RegExp regex = RegExp(pattern);
//   if (!regex.hasMatch(formPassword)) {
//     return '''
//       Password must be at least 8 characters,
//       include an uppercase letter, number and symbol.
//       ''';
//   }

//   return null;
}
