import 'package:fintech_app/constants/colors.dart';
import 'package:fintech_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 400,
            width: 400,
            color: secondaryColor,
            child: titleText(
              text: 'Send Money',
              color: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
