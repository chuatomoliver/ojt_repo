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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dashboardCard(
                text: 'Send Money',
                icon: Icons.send_rounded,
                context: context,
              ),
              rowSpacer(
                width: .06,
                context: context,
              ),
              dashboardCard(
                text: 'Transaction History',
                icon: Icons.history_rounded,
                context: context,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
