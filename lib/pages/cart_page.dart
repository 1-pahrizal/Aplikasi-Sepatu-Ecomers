import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    header() {
      return AppBar(
        backgroundColor: bacroud1Color,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      );
    }

    Widget empetcart() {
      return Container(
        color: bacroud3Color,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Iconshop.png',
              height: 69,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Opss! Your Cart is Empty',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 12),
            Text(
              "Let's find your favorite shoes",
              style:
                  secondTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 44,
                width: 152,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (route) => false);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primatyColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                        fontWeight: medium, fontSize: 16),
                  ),
                ))
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: cartProvider.carts
              .map(
                (cart) => CardCart(cart: cart),
              )
              .toList());
    }

    Widget costomBottomNav() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal',
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: reguler)),
                  Text(
                    '\$${cartProvider.totalPrice()}',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 0.4,
              color: subtitleColor,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chekout');
                },
                style: TextButton.styleFrom(
                    backgroundColor: primatyColor,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextStyle,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryTextColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bacroud3Color,
      appBar: header(),
      body: cartProvider.carts.length == 0 ? empetcart() : content(),
      bottomNavigationBar:
          cartProvider.carts.length == 0 ? SizedBox() : costomBottomNav(),
    );
  }
}
