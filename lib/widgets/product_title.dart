import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/product_page.dart';
import 'package:shamo/theme.dart';

class PeroductTitle extends StatelessWidget {
  final ProductModel products;
  const PeroductTitle({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(products: products),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                products.galleries[0].url,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
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
                  products.category.name,
                  style: secondTextStyle.copyWith(fontSize: 12),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  products.name,
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semibold),
                  maxLines: 1,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  '\$${products.price} ',
                  style:
                      priceTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
