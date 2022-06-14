import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:food_apps/screens/checkout_screen.dart';
import 'package:food_apps/screens/confirm_screen.dart';
import 'package:food_apps/screens/confirm_screen2.dart';
import 'package:food_apps/widgets/menu_card.dart';

import '../models/menu.dart';
import '../theme.dart';

class Cart2 extends StatefulWidget {
  const Cart2({Key? key}) : super(key: key);

  @override
  State<Cart2> createState() => _CartState2();
}

class _CartState2 extends State<Cart2> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset('assets/btn_back.png', width: 40),
                    ),
                  ),
                  Text(
                    'Keranjang',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                      Text(
                        'Pilih Semua',
                        style: poppinsTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: blackColor),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 100),
                        child: Text(
                          'Hapus',
                          style: poppinsTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                              color: blackColor),
                        ),
                      ),
                    ],
                  ),
                )),
            Text(
              'Alamat Pengiriman',
              style: poppinsTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Jalan Joyo Grand Kav Depag III no 79, KOTA MALANG, LOWOKWARU, JAWA TIMUR, ID, 65144',
                style: poppinsTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: greyColor,
                ),
              ),
            ),
            const SizedBox(height: 22),
            MenuCard(
              Menu(
                id: 1,
                image: 'assets/image2.png',
                name: 'Grilled Burger',
                price: 28000,
                pricePromo: 22000,
                note: 'Free Delivery',
                isPromo: false,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                  Material(
                    color: whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    elevation: 2,
                    child: AspectRatio(
                      aspectRatio: 15 / 1,
                      child: Center(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Catatan: ',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8)),
                          // controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Total',
                style: poppinsTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              Text('Rp.18.000',
                  style: poppinsTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: yellowColor,
                  ))
            ]),
            // const SizedBox(height: 10,),
            Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                // ignore: deprecated_member_use
                child: RaisedButton(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                    focusElevation: 0,
                    hoverElevation: 0,
                    disabledElevation: 0,
                    highlightElevation: 0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ConfirmScreen2()));
                    },
                    color: yellowColor,
                    child: Text('Pesan Sekarang',
                        style: poppinsTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: whiteColor,
                        ))))
          ],
        ),
      ),
    ));
  }
}
