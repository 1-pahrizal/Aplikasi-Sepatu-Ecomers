import 'package:flutter/material.dart';

import '../theme.dart';

class LoadingButtom extends StatelessWidget {
  const LoadingButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: primatyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(primaryTextColor),
              ),
            ),
            SizedBox(width: 4),
            Text(
              'Loading',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
