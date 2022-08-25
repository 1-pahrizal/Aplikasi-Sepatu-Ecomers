import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/wihlist_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/wishlist_cart.dart';

class WhislistPage extends StatelessWidget {
  WhislistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    header() {
      return AppBar(
        backgroundColor: bacroud1Color,
        centerTitle: true,
        title: Text(
          'Favorite Shoes',
          style: primaryTextStyle,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWislist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: bacroud3Color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Love Icon.png',
                width: 74,
              ),
              SizedBox(height: 23),
              Text(
                " You don't have dream shoes?",
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(height: 12),
              Text(
                " Let's find your favorite shoes",
                style:
                    secondTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
              ),
              SizedBox(height: 20),
              Container(
                height: 44,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: primatyColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Explore Store",
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    )),
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        color: bacroud3Color,
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: wishlistProvider.wishlist
                .map(
                  (product) => WishlistCart(product: product),
                )
                .toList()),
      ));
    }

    return Column(
      children: [
        header(),
        //emptyWislist(),
        wishlistProvider.wishlist.length == 0 ? emptyWislist() : content()
      ],
    );
  }
}
