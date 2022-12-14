import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';

class CardCart extends StatelessWidget {
  final CartModel cart;
  const CardCart({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color: bacroud4Color, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        cart.product.galleries[0].url,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart.product.name,
                        style: primaryTextStyle.copyWith(fontWeight: semibold),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        '\$${cart.product.price}',
                        style: priceTextStyle.copyWith(fontWeight: semibold),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cartProvider.addQuantity(cart.id);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/Add_jumlah.png',
                        width: 25,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        cart.quantity.toString(),
                        style: primaryTextStyle.copyWith(
                            fontWeight: medium, fontSize: 15),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          cartProvider.reduceQuantity(cart.id);
                        },
                        child: Image.asset(
                          'assets/Bottom_kurang.png',
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                cartProvider.removeCart(cart.id);
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/remove.png',
                    width: 14,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Remove',
                    style: alertTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
