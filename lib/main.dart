import 'package:flutter/material.dart';
import 'package:food_apps/screens/home_screen.dart';
import 'package:food_apps/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_apps/screens/signin_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LoginScreenProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Apps',
        theme: ThemeData(),
        home: MainPage(),
      ));
}

class MainPage extends StatelessWidget {
  // const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return HomeScreen();
          } else if (snapshot.hasError) {
            return Center(child: Text('Something Went Wrong!'));
          } else {
            return SignInScreen();
          }
        },
      ),
    );
  }
}
