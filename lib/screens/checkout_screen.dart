import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_apps/theme.dart';
import 'package:food_apps/screens/confirm_screen.dart';
import 'package:food_apps/screens/home_screen.dart';
import 'package:food_apps/widgets/menu_card.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  margin: const EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: const Text("Pesananan telah berhasil",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16)),
                    color: yellowColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    padding: const EdgeInsets.all(16),
                  )),
            ],
          )),
    );
  }
}
