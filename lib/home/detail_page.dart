import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_buble.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: bacroud1Color,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/p.png',
                width: 50,
                height: 50,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                  Text(
                    'Online',
                    style: secondTextStyle.copyWith(
                        fontSize: 14, fontWeight: light),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget productPriviwe() {
      return Container(
        width: 225,
        height: 74,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: bacroud5Color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primatyColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/Sepatu.png',
                height: 54,
                width: 54,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'COURT VISIO...',
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: reguler),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Text(
                    '\$57,15',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/Group 15.png',
              height: 22,
              width: 22,
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            productPriviwe(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: bacroud4Color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Typle Message...',
                        hintStyle: subtitleTextStyle,
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/send_Button.png',
                  height: 45,
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: const [
          ChatBubble(
            isSender: true,
            text: 'Hi, This item is still available?',
            hasProduct: true,
          ),
          ChatBubble(
            isSender: false,
            text: 'Good night, This item is onlyavailable in size 42 and 43',
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bacroud1Color,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
