import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_apps/models/menu.dart';
import 'package:food_apps/screens/cart.dart';
import 'package:food_apps/theme.dart';
import 'package:food_apps/widgets/menu_card.dart';
import 'package:food_apps/screens/login_screen.dart';
import 'package:food_apps/widgets/menu_card2.dart';
import 'package:food_apps/widgets/menu_card3.dart';
import 'package:food_apps/widgets/menu_card4.dart';
import 'package:provider/provider.dart';
import 'package:food_apps/screens/login_screen.dart';
import 'package:food_apps/screens/signin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      child: const Text('Sign Out'),
                      onPressed: () {
                        final provider = Provider.of<LoginScreenProvider>(
                            context,
                            listen: false);
                        provider.Logout();
                      }),
                  Container(
                    margin: const EdgeInsets.only(right: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Cart()));
                      },
                      child: Image.asset('assets/btn_cart.png', width: 40),
                    ),
                  )
                ],
              ),
              Text(
                'Burger BROS',
                style: poppinsTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              Text(
                'Enjoy Your Meal',
                style: poppinsTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: greyColor,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                'Recomended Menu',
                style: poppinsTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 22),
              MenuCard(
                Menu(
                  id: 1,
                  image: 'assets/image1.png',
                  name: 'Burger Regular',
                  price: 20000,
                  pricePromo: 15000,
                  note: 'Free Delivery',
                  isPromo: true,
                ),
              ),
              const SizedBox(height: 20),
              MenuCard2(
                Menu(
                  id: 2,
                  image: 'assets/image2.png',
                  name: 'Grilled Burger',
                  price: 28000,
                  pricePromo: 22000,
                  note: 'Free Delivery',
                  isPromo: false,
                ),
              ),
              const SizedBox(height: 20),
              MenuCard3(
                Menu(
                  id: 3,
                  image: 'assets/image3.png',
                  name: 'Fish Burger',
                  price: 25000,
                  pricePromo: 18000,
                  note: 'Free Delivery',
                  isPromo: false,
                ),
              ),
              const SizedBox(height: 20),
              MenuCard4(
                Menu(
                  id: 4,
                  image: 'assets/image4.png',
                  name: 'Chicken Burger',
                  price: 22000,
                  pricePromo: 16000,
                  note: 'Free Delivery',
                  isPromo: false,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
