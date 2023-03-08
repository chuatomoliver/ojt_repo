import 'package:fintech_app/constants/colors.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // titleText(
          //   text: 'Dashboard',
          //   color: secondaryColor,
          //   weight: FontWeight.bold,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dashboardCard(
                text: 'Send\nMoney',
                icon: Icons.send_rounded,
                context: context,
                onPressed: () {},
              ),
              rowSpacer(
                width: .06,
                context: context,
              ),
              dashboardCard(
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
