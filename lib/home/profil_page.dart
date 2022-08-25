import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/main.dart';

import '../models/user_model.dart';
import '../providers/auth_provider.dart';

class Profil_Page extends StatelessWidget {
  const Profil_Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthPrvider authPrvider = Provider.of<AuthPrvider>(context);
    UserModel user = authPrvider.user;
    header(context) {
      return AppBar(
        backgroundColor: bacroud1Color,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
            child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  user.profile_photo_url,
                  width: 64,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hallo, ${user.name}',
                      style: primaryTextStyle.copyWith(
                          fontSize: 24, fontWeight: semibold),
                    ),
                    Text(
                      '@${user.username}',
                      style: subtitleTextStyle.copyWith(
                          fontSize: 16, fontWeight: reguler),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign-in', (route) => false);
                },
                child: Image.asset(
                  'assets/Exit Button.png',
                  width: 20,
                ),
              )
            ],
          ),
        )),
      );
    }

    Widget MenuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondTextStyle.copyWith(fontSize: 13),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryTextColor,
            )
          ],
        ),
      );
    }

    Widget content(context) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          decoration: BoxDecoration(color: bacroud3Color),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semibold),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                  child: MenuItem('Edit Profile')),
              MenuItem('Yours Order'),
              MenuItem('Help'),
              SizedBox(
                height: 30,
              ),
              Text(
                'Ganeral',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semibold),
              ),
              MenuItem('Privacy & Policy'),
              MenuItem('Term of Service'),
              MenuItem('Rate APP'),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [header(context), content(context)],
    );
  }
}
