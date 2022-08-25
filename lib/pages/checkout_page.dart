import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/transksions_providers.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/checkout_card.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthPrvider authPrvider = Provider.of<AuthPrvider>(context);
    handleCheckout() async {
      if (await transactionProvider.checkout(
        authPrvider.user.token,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/chekout-succsees', (route) => false);
      }
    }

    header() {
      return AppBar(
        backgroundColor: bacroud1Color,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          //NOTE : LIST ITEMS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 16),
                ),
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => ChekoutCard(cart: cart),
                      )
                      .toList(),
                )
              ],
            ),
          ),

          //NOTE: ADRESS DETAILS
          //
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bacroud4Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 16),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/Building Icon.png',
                          width: 45,
                        ),
                        Image.asset(
                          'assets/Line 1.png',
                          height: 40,
                        ),
                        Image.asset(
                          'assets/Location.png',
                          width: 45,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'store location',
                          style: secondTextStyle.copyWith(
                              fontWeight: light, fontSize: 14),
                        ),
                        Text(
                          'Adidas Core',
                          style: primaryTextStyle.copyWith(
                              fontWeight: medium, fontSize: 14),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Your Address',
                          style: secondTextStyle.copyWith(
                              fontWeight: light, fontSize: 14),
                        ),
                        Text(
                          'Marsemoon',
                          style: primaryTextStyle.copyWith(
                              fontWeight: medium, fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: defaultMargin),
            decoration: BoxDecoration(
              color: bacroud4Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 16),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: secondTextStyle.copyWith(
                          fontWeight: reguler, fontSize: 12),
                    ),
                    Text(
                      '${cartProvider.totaItems()} Items',
                      style: primaryTextStyle.copyWith(
                          fontWeight: medium, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: secondTextStyle.copyWith(
                          fontWeight: reguler, fontSize: 12),
                    ),
                    Text(
                      '\$${cartProvider.totalPrice()}',
                      style: primaryTextStyle.copyWith(
                          fontWeight: medium, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: secondTextStyle.copyWith(
                          fontWeight: reguler, fontSize: 12),
                    ),
                    Text(
                      'Free',
                      style: primaryTextStyle.copyWith(
                          fontWeight: medium, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                Divider(
                  thickness: 1,
                  color: Color(0xff2e3241),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                          fontWeight: semibold, fontSize: 14),
                    ),
                    Text(
                      '\$${cartProvider.totalPrice()}',
                      style: priceTextStyle.copyWith(
                          fontWeight: semibold, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 42),
          const Divider(
            thickness: 1,
            color: Color(0xff2e3241),
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: defaultMargin,
            ),
            child: TextButton(
              onPressed: handleCheckout,
              style: TextButton.styleFrom(
                backgroundColor: primatyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Checkout Now',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bacroud3Color,
      appBar: header(),
      body: content(),
    );
  }
}
