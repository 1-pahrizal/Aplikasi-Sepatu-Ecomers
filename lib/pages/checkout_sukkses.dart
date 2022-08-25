import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:matcher/matcher.dart';

import '../theme.dart';

class CheckoutSuckses extends StatelessWidget {
  const CheckoutSuckses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    header() {
      return AppBar(
        backgroundColor: bacroud1Color,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Checkout Success',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Iconshop.png',
              width: 80,
            ),
            const SizedBox(height: 20),
            Text(
              'You made a transaction',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 12),
            Text(
              'Stay at home while we\nprepare your dream shoes',
              textAlign: TextAlign.center,
              style: secondTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            Container(
              width: 196,
              height: 44,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: BoxDecoration(
                  color: primatyColor, borderRadius: BorderRadius.circular(12)),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: Text('Order Other Shoes',
                    style: primaryTextStyle.copyWith(
                        fontWeight: medium, fontSize: 16)),
              ),
            ),
            Container(
              width: 196,
              height: 44,
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                  color: Color(0xff39374B),
                  borderRadius: BorderRadius.circular(12)),
              child: TextButton(
                onPressed: () {},
                child: Text('View My Order',
                    style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                        color: Color(0xffB7B6BF))),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bacroud3Color,
      appBar: header(),
      body: content(),
    );
  }
}
