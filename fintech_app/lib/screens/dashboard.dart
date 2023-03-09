import 'package:fintech_app/constants/colors.dart';
import 'package:fintech_app/screens/send_money.dart';
import 'package:fintech_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleText(
          text: 'Dashboard',
          color: secondaryColor,
          weight: FontWeight.bold,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                width: 3,
                color: secondaryColor,
              ),
            ),
            width: MediaQuery.of(context).size.width * .96,
            height: MediaQuery.of(context).size.height * .32,
            child: Center(
              child: titleText(
                text: '\$9000.00',
                color: secondaryColor,
                weight: FontWeight.normal,
              ),
            ),
          ),
          // titleText(
          //   text: 'Dashboard',
          //   color: secondaryColor,
          //   weight: FontWeight.bold,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'test',
                child: dashboardCard(
                  contentColor: primaryColor,
                  fillColor: tertiaryColor,
                  outlineColor: Colors.transparent,
                  text: 'Send\nMoney',
                  icon: Icons.send_rounded,
                  context: context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SendMoney(),
                      ),
                    );
                  },
                ),
              ),
              rowSpacer(
                width: .06,
                context: context,
              ),
              dashboardCard(
                outlineColor: secondaryColor,
                fillColor: Colors.transparent,
                contentColor: secondaryColor,
                text: 'Transaction History',
                icon: Icons.history_rounded,
                context: context,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return bottomContainer();
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
